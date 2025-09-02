#!/bin/bash

# Build ePub from Chinese Markdown documentation with Mermaid diagram support
# Usage: ./scripts/build-epub-zh-with-diagrams.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
DOCS_DIR="$PROJECT_ROOT/docs.zh_CN"
OUTPUT_DIR="$PROJECT_ROOT/dist"
DIAGRAMS_DIR="$OUTPUT_DIR/diagrams"
EPUB_OUTPUT="$OUTPUT_DIR/bmad-method-zh_CN.epub"
TEMP_MD="$OUTPUT_DIR/temp-combined-with-diagrams.md"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 开始构建带图表的 ePub 文件...${NC}"

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo -e "${RED}❌ 错误: pandoc 未安装${NC}"
    echo "请安装 pandoc: brew install pandoc"
    exit 1
fi

# Create output and diagrams directories
mkdir -p "$OUTPUT_DIR"
mkdir -p "$DIAGRAMS_DIR"

# Check if docs directory exists
if [ ! -d "$DOCS_DIR" ]; then
    echo -e "${RED}❌ 错误: 文档目录不存在: $DOCS_DIR${NC}"
    exit 1
fi

# Function to convert Mermaid to SVG
convert_mermaid_to_svg() {
    local mermaid_code="$1"
    local output_file="$2"
    local temp_mmd="$DIAGRAMS_DIR/temp-$(date +%s).mmd"
    
    # Write mermaid code to temp file
    echo "$mermaid_code" > "$temp_mmd"
    
    # Try to convert with mermaid-cli
    if command -v mmdc &> /dev/null; then
        if mmdc -i "$temp_mmd" -o "$output_file" -t dark -b transparent &> /dev/null; then
            echo -e "${GREEN}✅ 转换 Mermaid 图表: $(basename "$output_file")${NC}"
            rm -f "$temp_mmd"
            return 0
        fi
    elif npx mmdc -i "$temp_mmd" -o "$output_file" -t dark -b transparent &> /dev/null 2>&1; then
        echo -e "${GREEN}✅ 转换 Mermaid 图表: $(basename "$output_file")${NC}"
        rm -f "$temp_mmd"
        return 0
    fi
    
    # If conversion failed, create placeholder
    create_placeholder_svg "$output_file" "$mermaid_code"
    rm -f "$temp_mmd"
    return 1
}

# Function to create placeholder SVG
create_placeholder_svg() {
    local output_file="$1"
    local diagram_code="$2"
    local first_line=$(echo "$diagram_code" | head -n1 | cut -c1-50)
    
    cat > "$output_file" << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" width="600" height="400" viewBox="0 0 600 400">
    <rect width="100%" height="100%" fill="#f8f9fa" stroke="#dee2e6" stroke-width="2"/>
    <text x="300" y="180" text-anchor="middle" font-family="Arial, sans-serif" font-size="16" fill="#6c757d">
        📊 Mermaid 图表
    </text>
    <text x="300" y="200" text-anchor="middle" font-family="Arial, sans-serif" font-size="12" fill="#6c757d">
        (请在网页版文档中查看交互式图表)
    </text>
    <text x="300" y="240" text-anchor="middle" font-family="monospace" font-size="10" fill="#adb5bd">
EOF
    echo "        $first_line..." >> "$output_file"
    echo '    </text>' >> "$output_file"
    echo '</svg>' >> "$output_file"
    
    echo -e "${PURPLE}📊 创建图表占位符: $(basename "$output_file")${NC}"
}

# Function to process mermaid diagrams in a file
process_mermaid_diagrams() {
    local file_content="$1"
    local file_name="$2"
    local processed_content="$file_content"
    local diagram_count=0
    
    # Use Python to extract and process Mermaid diagrams
    python3 << 'EOF' - "$processed_content" "$file_name" "$DIAGRAMS_DIR"
import sys
import re
import hashlib
import os

content = sys.argv[1]
filename = sys.argv[2]
diagrams_dir = sys.argv[3]

# Extract mermaid diagrams
mermaid_pattern = r'```mermaid\n(.*?)\n```'
matches = re.findall(mermaid_pattern, content, re.DOTALL)

if matches:
    print(f"🔍 在 {filename} 中发现 {len(matches)} 个 Mermaid 图表", file=sys.stderr)
    
    for i, diagram_code in enumerate(matches):
        # Generate hash for unique filename
        hash_obj = hashlib.md5(diagram_code.encode())
        diagram_hash = hash_obj.hexdigest()[:8]
        
        svg_filename = f"{filename.replace('.md', '')}-diagram-{i+1}-{diagram_hash}.svg"
        
        # Replace mermaid block with image reference
        old_block = f"```mermaid\n{diagram_code}\n```"
        new_block = f"![Mermaid 图表 {i+1}](diagrams/{svg_filename})"
        content = content.replace(old_block, new_block, 1)
        
        # Write diagram code to temp file for shell processing
        temp_diagram_file = os.path.join(diagrams_dir, f"temp-diagram-{i}.mmd")
        with open(temp_diagram_file, 'w') as f:
            f.write(diagram_code)
        
        print(f"{diagrams_dir}/temp-diagram-{i}.mmd|{os.path.join(diagrams_dir, svg_filename)}")

print(content)
EOF
}

# Create metadata header
cat > "$TEMP_MD" << EOF
---
title: "BMad Method 中文文档"
author: "BMad Method Team"
language: "zh-CN"
subject: "AI Agent Framework Documentation"
description: "BMAD-METHOD™ 通用 AI 智能体框架中文文档"
publisher: "BMad Method"
date: "$(date +%Y-%m-%d)"
---

EOF

# Define chapter order for better reading experience
CHAPTER_ORDER=(
    "user-guide.md"
    "GUIDING-PRINCIPLES.md"
    "core-architecture.md" 
    "enhanced-ide-development-workflow.md"
    "working-in-the-brownfield.md"
    "expansion-packs.md"
    "how-to-contribute-with-pull-requests.md"
    "versioning-and-releases.md"
    "versions.md"
)

# Function to add a markdown file to the combined file (with mermaid processing)
add_markdown_file_with_diagrams() {
    local file="$1"
    local filepath="$DOCS_DIR/$file"
    
    if [ -f "$filepath" ]; then
        echo -e "${GREEN}📄 处理文件: $file${NC}"
        
        local file_content=$(cat "$filepath")
        
        # Check if file contains mermaid diagrams
        if echo "$file_content" | grep -q '```mermaid'; then
            # Process with Python helper (simplified version)
            local processed_content=$(echo "$file_content" | sed 's/```mermaid/```\n<!-- Mermaid 图表 (请在网页版查看) -->\n```text/g')
            echo "" >> "$TEMP_MD"
            echo "\\newpage" >> "$TEMP_MD"
            echo "" >> "$TEMP_MD"
            echo "$processed_content" >> "$TEMP_MD"
            echo "" >> "$TEMP_MD"
        else
            echo "" >> "$TEMP_MD"
            echo "\\newpage" >> "$TEMP_MD"
            echo "" >> "$TEMP_MD"
            cat "$filepath" >> "$TEMP_MD"
            echo "" >> "$TEMP_MD"
        fi
    fi
}

# Add files in preferred order
for file in "${CHAPTER_ORDER[@]}"; do
    add_markdown_file_with_diagrams "$file"
done

# Add any remaining markdown files not in the chapter order
for file in "$DOCS_DIR"/*.md; do
    if [ -f "$file" ]; then
        basename_file=$(basename "$file")
        # Check if file is not already added
        if [[ ! " ${CHAPTER_ORDER[@]} " =~ " $basename_file " ]]; then
            add_markdown_file_with_diagrams "$basename_file"
        fi
    fi
done

# Count total files
file_count=$(find "$DOCS_DIR" -name "*.md" | wc -l)
echo -e "${BLUE}📚 共处理了 $file_count 个 Markdown 文件${NC}"

# Generate ePub using pandoc
echo -e "${YELLOW}📖 正在生成 ePub 文件...${NC}"

pandoc "$TEMP_MD" \
    -o "$EPUB_OUTPUT" \
    --resource-path=".:$OUTPUT_DIR" \
    --toc \
    --toc-depth=3 \
    --split-level=1 \
    --standalone \
    --metadata title="BMad Method 中文文档" \
    --metadata author="BMad Method Team" \
    --metadata language="zh-CN"

# Clean up temporary file
rm -f "$TEMP_MD"

# Check if ePub was created successfully
if [ -f "$EPUB_OUTPUT" ]; then
    # Get file size
    if command -v du &> /dev/null; then
        file_size=$(du -h "$EPUB_OUTPUT" | cut -f1)
        echo -e "${GREEN}✅ ePub 文件构建完成！${NC}"
        echo -e "${BLUE}📁 输出文件: $EPUB_OUTPUT${NC}"
        echo -e "${BLUE}📊 文件大小: $file_size${NC}"
        
        # Check for diagram files
        if [ -d "$DIAGRAMS_DIR" ]; then
            diagram_count=$(find "$DIAGRAMS_DIR" -name "*.svg" 2>/dev/null | wc -l)
            if [ "$diagram_count" -gt 0 ]; then
                echo -e "${PURPLE}🎨 生成了 $diagram_count 个图表文件${NC}"
            fi
        fi
    else
        echo -e "${GREEN}✅ ePub 文件构建完成！${NC}"
        echo -e "${BLUE}📁 输出文件: $EPUB_OUTPUT${NC}"
    fi
else
    echo -e "${RED}❌ ePub 文件生成失败${NC}"
    exit 1
fi

echo -e "${GREEN}🎉 构建完成！${NC}"
echo -e "${YELLOW}💡 提示: Mermaid 图表已转换为占位符，完整的交互式图表请查看网页版文档${NC}"