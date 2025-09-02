#!/bin/bash

# Build ePub from Chinese Markdown documentation
# Usage: ./scripts/build-epub-zh.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
DOCS_DIR="$PROJECT_ROOT/docs.zh_CN"
OUTPUT_DIR="$PROJECT_ROOT/dist"
EPUB_OUTPUT="$OUTPUT_DIR/bmad-method-zh_CN.epub"
TEMP_MD="$OUTPUT_DIR/temp-combined.md"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 开始构建 ePub 文件...${NC}"

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo -e "${RED}❌ 错误: pandoc 未安装${NC}"
    echo "请安装 pandoc: brew install pandoc"
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Check if docs directory exists
if [ ! -d "$DOCS_DIR" ]; then
    echo -e "${RED}❌ 错误: 文档目录不存在: $DOCS_DIR${NC}"
    exit 1
fi

# Create metadata header
cat > "$TEMP_MD" << 'EOF'
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

# Function to add a markdown file to the combined file
add_markdown_file() {
    local file="$1"
    local filepath="$DOCS_DIR/$file"
    
    if [ -f "$filepath" ]; then
        echo -e "${GREEN}📄 添加文件: $file${NC}"
        echo "" >> "$TEMP_MD"
        echo "\\newpage" >> "$TEMP_MD"
        echo "" >> "$TEMP_MD"
        cat "$filepath" >> "$TEMP_MD"
        echo "" >> "$TEMP_MD"
    fi
}

# Add files in preferred order
for file in "${CHAPTER_ORDER[@]}"; do
    add_markdown_file "$file"
done

# Add any remaining markdown files not in the chapter order
for file in "$DOCS_DIR"/*.md; do
    if [ -f "$file" ]; then
        basename_file=$(basename "$file")
        # Check if file is not already added
        if [[ ! " ${CHAPTER_ORDER[@]} " =~ " $basename_file " ]]; then
            add_markdown_file "$basename_file"
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
    --toc \
    --toc-depth=3 \
    --epub-chapter-level=1 \
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
    else
        echo -e "${GREEN}✅ ePub 文件构建完成！${NC}"
        echo -e "${BLUE}📁 输出文件: $EPUB_OUTPUT${NC}"
    fi
else
    echo -e "${RED}❌ ePub 文件生成失败${NC}"
    exit 1
fi

echo -e "${GREEN}🎉 构建完成！${NC}"