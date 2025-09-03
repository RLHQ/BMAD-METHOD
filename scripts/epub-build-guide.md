# ePub 构建指南

本指南介绍如何将 `docs.zh_CN` 目录下的中文 Markdown 文档构建成 ePub 电子书格式。

## 🚀 快速开始

### 中文 ePub 构建（包含 Mermaid 图表处理）

```bash
npm run build:epub-zh
```

此命令会自动：

- 处理所有中文 Markdown 文档
- 转换 Mermaid 图表为 SVG 或创建占位符
- 生成完整的中文 ePub 电子书

## 📊 Mermaid 图表处理

### 问题描述

ePub 阅读器不支持 JavaScript，因此无法渲染 Mermaid 图表。我们提供了以下解决方案：

### 解决方案

#### 1. 自动转换（推荐）

如果系统安装了 `@mermaid-js/mermaid-cli`，脚本会：

- 自动将 Mermaid 代码转换为 SVG 图片
- 在 ePub 中显示为静态图表
- 保持图表的视觉效果

安装 mermaid-cli：

```bash
npm install -g @mermaid-js/mermaid-cli
# 或
npx @mermaid-js/mermaid-cli
```

#### 2. 占位符模式（后备方案）

如果无法转换，脚本会：

- 创建包含图表信息的 SVG 占位符
- 提示用户查看网页版获取完整图表
- 确保 ePub 构建不会失败

## 📚 输出结果

### 文件位置

- **ePub 文件**: `dist/bmad-method-zh_CN.epub`
- **图表文件**: `dist/diagrams/` （包含转换后的 SVG 图表）

### 章节顺序

构建脚本按以下逻辑顺序组织文档：

1. **用户指南** (`user-guide.md`) - 入门和基础概念
2. **指导原则** (`GUIDING-PRINCIPLES.md`) - 核心理念
3. **核心架构** (`core-architecture.md`) - 系统设计
4. **IDE 开发工作流程** (`enhanced-ide-development-workflow.md`) - 开发实践
5. **棕地项目工作** (`working-in-the-brownfield.md`) - 现有项目集成
6. **扩展包** (`expansion-packs.md`) - 功能扩展
7. **贡献指南** (`how-to-contribute-with-pull-requests.md`) - 开发者指南
8. **版本管理** (`versioning-and-releases.md`) - 版本控制
9. **版本历史** (`versions.md`) - 更新记录

## 🛠️ 技术细节

### 依赖要求

- **Pandoc**: ePub 生成工具
  ```bash
  brew install pandoc  # macOS
  ```
- **Python 3**: 图表处理辅助（系统通常已安装）
- **Node.js**: 运行构建脚本
- **mermaid-cli**: 图表转换（可选）
  ```bash
  npm install -g @mermaid-js/mermaid-cli
  ```

### 构建特性

- ✅ **自动目录生成**: 3 层深度的目录结构
- ✅ **中文字体支持**: 优化中文显示效果
- ✅ **图表处理**: 多种 Mermaid 图表处理策略
- ✅ **元数据完整**: 包含书籍信息和语言设置
- ✅ **错误处理**: 优雅处理构建过程中的问题
- ✅ **文件优化**: 合理的文件大小和结构

### 自定义选项

如需修改构建行为，可编辑脚本中的配置：

```javascript
// 在 scripts/build-epub-zh-with-diagrams.mjs 中
const CHAPTER_ORDER = [
  'user-guide.md',
  // ... 添加或重新排序章节
];

async function createMetadata() {
  const metadata = {
    title: '你的标题',
    author: '你的作者名',
    // ... 修改元数据
  };
  // ...
}
```

## 🎨 样式定制

ePub 使用自定义 CSS 样式，支持：

- 中文字体优化
- 代码高亮
- 表格美化
- 图表居中显示
- 引用块样式

样式文件位于 `scripts/epub-styles-enhanced.css`，由脚本自动生成。

## 🔧 故障排除

### 常见问题

1. **Pandoc 未找到**

   ```bash
   brew install pandoc
   ```

2. **Python 未找到**
   - macOS 和 Linux 通常预装 Python 3
   - Windows: 从 python.org 下载安装

3. **Mermaid 转换失败**
   - 检查 `@mermaid-js/mermaid-cli` 是否正确安装
   - 脚本会自动降级使用占位符模式

4. **中文显示问题**
   - 确保 ePub 阅读器支持中文字体
   - 推荐使用支持 CJK 字体的阅读器

### 调试模式

如需查看详细构建信息，可以直接运行脚本：

```bash
node scripts/build-epub-zh-with-diagrams.mjs
```

## 📖 推荐阅读器

以下 ePub 阅读器对中文和图表支持较好：

- **Adobe Digital Editions**
- **Calibre**
- **Apple Books** (macOS/iOS)
- **Google Play Books**
- **KyBook** (iOS/macOS)

## 🤝 贡献

如需改进 ePub 构建功能，请：

1. 修改相应的构建脚本
2. 测试各种场景
3. 更新此文档
4. 提交 Pull Request

---

**提示**: 完整的交互式 Mermaid 图表请查看项目的在线文档或本地网页版本。
