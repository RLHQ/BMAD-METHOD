/**
 * Build ePub from Chinese Markdown documentation
 * Usage: node scripts/build-epub-zh.js
 */

import fs from 'node:fs/promises';
import path from 'node:path';
import { execSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const DOCS_DIR = path.join(__dirname, '..', 'docs.zh_CN');
const OUTPUT_DIR = path.join(__dirname, '..', 'dist');
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

async function buildEpub() {
  try {
    console.log('🚀 开始构建 ePub 文件...');

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

      // Add chapter break and content
      combinedContent += `\n\n\\newpage\n\n${content}\n\n`;
      console.log(`📄 已添加: ${file}`);
    }

    // Write combined markdown to temp file
    const tempMd = path.join(OUTPUT_DIR, 'temp-combined.md');
    await fs.writeFile(tempMd, combinedContent);

    // Generate ePub using pandoc
    console.log('📖 正在生成 ePub 文件...');

    const pandocCommand = [
      'pandoc',
      tempMd,
      '-o',
      EPUB_OUTPUT,
      String.raw`--epub-metadata=<(echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?><package xmlns=\"http://www.idpf.org/2007/opf\" version=\"3.0\"><metadata xmlns:dc=\"http://purl.org/dc/elements/1.1/\"><dc:title>BMad Method 中文文档</dc:title><dc:creator>BMad Method Team</dc:creator><dc:language>zh-CN</dc:language></metadata></package>")`,
      '--toc',
      '--toc-depth=3',
      '--epub-chapter-level=1',
      `--css=${path.join(__dirname, 'epub-styles.css')}`,
      '--standalone',
    ].join(' ');

    try {
      execSync(pandocCommand, { stdio: 'inherit' });
    } catch {
      // Try simpler command if the complex one fails
      console.log('⚠️  使用简化命令重试...');
      const simplePandocCommand = [
        'pandoc',
        tempMd,
        '-o',
        EPUB_OUTPUT,
        '--toc',
        '--toc-depth=3',
        '--epub-chapter-level=1',
        '--standalone',
      ].join(' ');

      execSync(simplePandocCommand, { stdio: 'inherit' });
    }

    // Clean up temp file
    await fs.unlink(tempMd);

    // Get file size for output
    const stats = await fs.stat(EPUB_OUTPUT);
    const fileSizeInMB = (stats.size / (1024 * 1024)).toFixed(2);

    console.log('✅ ePub 文件构建完成！');
    console.log(`📁 输出文件: ${EPUB_OUTPUT}`);
    console.log(`📊 文件大小: ${fileSizeInMB} MB`);

    return EPUB_OUTPUT;
  } catch (error) {
    console.error('❌ 构建 ePub 时出错:', error.message);
    throw error;
  }
}

// Create basic CSS for ePub styling
async function createEpubStyles() {
  const cssPath = path.join(__dirname, 'epub-styles.css');
  const cssContent = `
/* ePub 样式 */
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
