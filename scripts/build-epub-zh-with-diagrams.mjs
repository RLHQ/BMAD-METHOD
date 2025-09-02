/**
 * Build ePub from Chinese Markdown documentation with Mermaid diagram conversion
 * Usage: node scripts/build-epub-zh-with-diagrams.js
 */

import fs from 'node:fs/promises';
import path from 'node:path';
import { execSync } from 'node:child_process';
import crypto from 'node:crypto';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const DOCS_DIR = path.join(__dirname, '..', 'docs.zh_CN');
const OUTPUT_DIR = path.join(__dirname, '..', 'dist');
const DIAGRAMS_DIR = path.join(OUTPUT_DIR, 'diagrams');
const EPUB_OUTPUT = path.join(OUTPUT_DIR, 'bmad-method-zh_CN.epub');

// Define the order of chapters for better reading experience
const CHAPTER_ORDER = [
  'user-guide.md',
  'GUIDING-PRINCIPLES.md',
  'core-architecture.md',
  'enhanced-ide-development-workflow.md',
  'working-in-the-brownfield.md',
  'expansion-packs.md',
  'how-to-contribute-with-pull-requests.md',
  'versioning-and-releases.md',
  'versions.md',
];

async function createMetadata() {
  const metadata = {
    title: 'BMad Method 中文文档',
    author: 'BMad Method Team',
    language: 'zh-CN',
    subject: 'AI Agent Framework Documentation',
    description: 'BMAD-METHOD™ 通用 AI 智能体框架中文文档',
    publisher: 'BMad Method',
    date: new Date().toISOString().split('T')[0],
  };

  const yamlContent = Object.entries(metadata)
    .map(([key, value]) => `${key}: "${value}"`)
    .join('\n');

  return `---\n${yamlContent}\n---\n\n`;
}

function extractMermaidDiagrams(content) {
  const mermaidRegex = /```mermaid\n([\s\S]*?)\n```/g;
  const diagrams = [];
  let match;

  while ((match = mermaidRegex.exec(content)) !== null) {
    const diagramCode = match[1];
    const hash = crypto.createHash('md5').update(diagramCode).digest('hex');
    diagrams.push({
      code: diagramCode,
      hash: hash,
      original: match[0],
    });
  }

  return diagrams;
}

async function convertMermaidToSvg(diagramCode, outputPath) {
  try {
    // Try using npx mermaid-cli if available
    const tempMmdFile = path.join(DIAGRAMS_DIR, `temp-${Date.now()}.mmd`);
    await fs.writeFile(tempMmdFile, diagramCode);

    try {
      execSync(`npx mmdc -i "${tempMmdFile}" -o "${outputPath}" -t dark -b transparent`, {
        stdio: 'pipe',
      });
      console.log(`✅ 转换 Mermaid 图表: ${path.basename(outputPath)}`);
      await fs.unlink(tempMmdFile);
      return true;
    } catch (error) {
      await fs.unlink(tempMmdFile);
      throw error;
    }
  } catch (error) {
    console.warn(`⚠️  无法转换 Mermaid 图表，将使用占位符: ${error.message}`);
    return false;
  }
}

async function createPlaceholderSvg(outputPath, diagramCode) {
  const placeholder = `<svg xmlns="http://www.w3.org/2000/svg" width="600" height="400" viewBox="0 0 600 400">
    <rect width="100%" height="100%" fill="#f8f9fa" stroke="#dee2e6" stroke-width="2"/>
    <text x="300" y="180" text-anchor="middle" font-family="Arial, sans-serif" font-size="16" fill="#6c757d">
      📊 Mermaid 图表
    </text>
    <text x="300" y="200" text-anchor="middle" font-family="Arial, sans-serif" font-size="12" fill="#6c757d">
      (请在网页版文档中查看交互式图表)
    </text>
    <text x="300" y="240" text-anchor="middle" font-family="monospace" font-size="10" fill="#adb5bd">
      ${diagramCode.split('\n')[0].slice(0, 50)}...
    </text>
  </svg>`;

  await fs.writeFile(outputPath, placeholder);
  console.log(`📊 创建图表占位符: ${path.basename(outputPath)}`);
}

async function processMermaidDiagrams(content, fileName) {
  const diagrams = extractMermaidDiagrams(content);

  if (diagrams.length === 0) {
    return content;
  }

  console.log(`🔍 在 ${fileName} 中发现 ${diagrams.length} 个 Mermaid 图表`);

  // Ensure diagrams directory exists
  await fs.mkdir(DIAGRAMS_DIR, { recursive: true });

  let processedContent = content;

  for (const [i, diagram] of diagrams.entries()) {
    const svgFileName = `${fileName.replace('.md', '')}-diagram-${i + 1}-${diagram.hash.slice(0, 8)}.svg`;
    const svgPath = path.join(DIAGRAMS_DIR, svgFileName);

    // Try to convert the diagram
    const converted = await convertMermaidToSvg(diagram.code, svgPath);

    if (!converted) {
      // Create a placeholder if conversion failed
      await createPlaceholderSvg(svgPath, diagram.code);
    }

    // Replace the mermaid code block with an image reference
    const imageMarkdown = `![Mermaid 图表 ${i + 1}](diagrams/${svgFileName})`;
    processedContent = processedContent.replace(diagram.original, imageMarkdown);
  }

  return processedContent;
}

async function buildEpub() {
  try {
    console.log('🚀 开始构建带图表的 ePub 文件...');

    // Ensure output directory exists
    await fs.mkdir(OUTPUT_DIR, { recursive: true });

    // Get all markdown files
    const files = await fs.readdir(DOCS_DIR);
    const markdownFiles = files.filter((file) => file.endsWith('.md'));

    // Sort files according to our preferred order
    const orderedFiles = [
      ...CHAPTER_ORDER.filter((file) => markdownFiles.includes(file)),
      ...markdownFiles.filter((file) => !CHAPTER_ORDER.includes(file)),
    ];

    console.log(`📚 发现 ${orderedFiles.length} 个 Markdown 文件`);

    // Create a combined markdown file with metadata
    let combinedContent = await createMetadata();

    for (const file of orderedFiles) {
      const filePath = path.join(DOCS_DIR, file);
      const content = await fs.readFile(filePath, 'utf8');

      // Process Mermaid diagrams in the content
      const processedContent = await processMermaidDiagrams(content, file);

      // Add chapter break and content
      combinedContent += `\n\n\\newpage\n\n${processedContent}\n\n`;
      console.log(`📄 已处理: ${file}`);
    }

    // Write combined markdown to temp file
    const tempMd = path.join(OUTPUT_DIR, 'temp-combined-with-diagrams.md');
    await fs.writeFile(tempMd, combinedContent);

    // Generate ePub using pandoc with diagram resources
    console.log('📖 正在生成 ePub 文件...');

    const pandocArgs = [
      'pandoc',
      `"${tempMd}"`,
      '-o',
      `"${EPUB_OUTPUT}"`,
      '--resource-path=.:' + OUTPUT_DIR,
      '--toc',
      '--toc-depth=3',
      '--split-level=1', // Updated from deprecated --epub-chapter-level
      '--standalone',
      '--metadata title="BMad Method 中文文档"',
      '--metadata author="BMad Method Team"',
      '--metadata language="zh-CN"',
    ];

    const pandocCommand = pandocArgs.join(' ');
    execSync(pandocCommand, { stdio: 'inherit', shell: true });

    // Clean up temp file
    await fs.unlink(tempMd);

    // Get file size for output
    const stats = await fs.stat(EPUB_OUTPUT);
    const fileSizeInMB = (stats.size / (1024 * 1024)).toFixed(2);

    console.log('✅ ePub 文件构建完成！');
    console.log(`📁 输出文件: ${EPUB_OUTPUT}`);
    console.log(`📊 文件大小: ${fileSizeInMB} MB`);

    // Check if diagrams were created
    try {
      const diagramFiles = await fs.readdir(DIAGRAMS_DIR);
      const svgFiles = diagramFiles.filter((f) => f.endsWith('.svg'));
      if (svgFiles.length > 0) {
        console.log(`🎨 生成了 ${svgFiles.length} 个图表文件`);
      }
    } catch {
      // Directory doesn't exist, no diagrams were created
    }

    return EPUB_OUTPUT;
  } catch (error) {
    console.error('❌ 构建 ePub 时出错:', error.message);
    throw error;
  }
}

// Create enhanced CSS for ePub styling
async function createEpubStyles() {
  const cssPath = path.join(__dirname, 'epub-styles-enhanced.css');
  const cssContent = `
/* ePub 样式 - 增强图表支持 */
body {
  font-family: "Noto Sans CJK SC", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
  line-height: 1.6;
  margin: 1em;
}

h1, h2, h3, h4, h5, h6 {
  color: #2c3e50;
  margin-top: 1.5em;
  margin-bottom: 0.5em;
}

h1 {
  border-bottom: 2px solid #3498db;
  padding-bottom: 0.3em;
}

code {
  background-color: #f8f9fa;
  padding: 0.2em 0.4em;
  border-radius: 3px;
  font-family: "SF Mono", Monaco, "Cascadia Code", "Roboto Mono", Consolas, "Courier New", monospace;
}

pre {
  background-color: #f8f9fa;
  padding: 1em;
  border-radius: 5px;
  overflow-x: auto;
}

blockquote {
  border-left: 4px solid #3498db;
  padding-left: 1em;
  margin: 1em 0;
  color: #555;
}

table {
  border-collapse: collapse;
  width: 100%;
  margin: 1em 0;
}

th, td {
  border: 1px solid #ddd;
  padding: 0.5em;
  text-align: left;
}

th {
  background-color: #f2f2f2;
  font-weight: bold;
}

/* 图表样式 */
img[alt*="Mermaid"] {
  max-width: 100%;
  height: auto;
  display: block;
  margin: 1em auto;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: white;
}

/* 图表标题 */
p img[alt*="Mermaid"] + em,
img[alt*="Mermaid"] + em {
  display: block;
  text-align: center;
  font-style: normal;
  font-size: 0.9em;
  color: #666;
  margin-top: 0.5em;
}
`;

  await fs.writeFile(cssPath, cssContent);
  return cssPath;
}

// Main execution
try {
  await createEpubStyles();
  await buildEpub();
} catch (error) {
  console.error('❌ 程序执行失败:', error.message);
  throw error;
}

export { buildEpub };
