# BMAD-METHOD™ Playbook for Product Owners

这是一个专门为 IT BP 部门 PO 角色设计的 Slidev 演示文稿，展示了 BMAD-METHOD 如何改善产品管理工作流程，特别是在以下四个关键领域：

- 🔍 **竞品调研** - AI 分析师协助深度市场分析
- 📝 **需求设计** - 结构化需求澄清与验证
- 📋 **PRD 撰写** - AI 产品经理协作生成专业文档
- 🎨 **原型输出** - 快速从想法到可用原型

## 快速开始

### 安装依赖

```bash
npm install
```

### 开发模式

```bash
npm run dev
```

访问 http://localhost:3030 查看演示文稿

### 构建静态文件

```bash
npm run build
```

### 导出 PDF

```bash
npm run export
```

## 演示文稿结构

1. **开场白** - 抓住 PO 角色注意力
2. **痛点识别** - 当前工作中的挑战
3. **解决方案** - BMAD-METHOD 核心价值
4. **应用场景** - 具体工作流程改进
5. **ROI 分析** - 量化投资回报
6. **行动呼吁** - 如何开始使用

## 目标受众

- IT BP 部门的 Product Owner
- 产品经理
- 业务分析师
- 项目管理人员

## 核心信息

展示 AI 如何从以下方面改善 PO 工作：

- **效率提升**：从 4 周到 4 天的原型开发周期
- **质量保证**：标准化流程和文档模板
- **成本节约**：减少 60% 重复性工作
- **协作优化**：统一的工作流和沟通标准

## 技术要求

- Node.js 16+
- 现代浏览器（Chrome, Firefox, Safari, Edge）
- 网络连接（用于外部资源）

## 自定义

演示文稿使用 Slidev 构建，可以通过修改 `slides.md` 文件来自定义内容。更多配置选项请参考 [Slidev 文档](https://sli.dev/)。

## ⚠️ 重要提醒：Slidev文件编辑规则

**编辑slides.md文件时请严格遵循以下规则：**

### 🚫 禁止操作

1. **禁用自动格式化** - 不要使用"Format on Save"或手动格式化
2. **禁用Prettier** - slides.md已在忽略列表中，但请确认IDE设置
3. **避免批量编辑** - 不要使用查找替换等可能破坏结构的操作

### ✅ 正确编辑方式

1. **手动保存** - 使用 `Cmd+S` / `Ctrl+S`，不使用格式化保存
2. **逐页编辑** - 一次编辑一个slide，避免大范围修改
3. **验证语法** - 编辑后立即用 `npm run dev` 检查是否正常

### 📝 Slidev语法要求

1. **页面分隔符格式**：
   ```markdown
   ---
   layout: two-cols
   ---
   ```
2. **YAML Front Matter**：必须紧跟在 `---` 后，不能有空行
3. **布局声明**：layout必须在YAML中，不能在markdown标题中
4. **分隔符规则**：页面间用单个`---`分隔，前后不加额外空行

### 🔧 项目配置说明

项目已在以下文件中配置Slidev忽略规则：

- `/.prettierignore` - 全局忽略slides.md文件
- `/prettier.config.mjs` - 特殊处理Slidev文件格式
- `/bmad-playbook/.prettierrc.json` - 子目录专用配置
- `/bmad-playbook/.prettierignore` - 子目录忽略规则

### 🆘 问题排查

如果slides显示异常：

1. 检查是否有多余的空行在 `---` 周围
2. 确认layout声明格式正确
3. 验证YAML语法是否有误
4. 运行 `npm run dev` 查看控制台错误
