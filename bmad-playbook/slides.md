---
theme: default
background: '#f8f9fa'
class: text-center
highlighter: shiki
lineNumbers: false
info: |
  ## BMAD-METHOD™ for Product Owners
  AI-Driven Agile Development Framework
drawings:
  persist: false
transition: slide-left
title: BMAD-METHOD™ for Product Owners
mdc: true
colorSchema: light
css: |
  .slidev-layout {
    background-image: 
      linear-gradient(rgba(233, 236, 239, 0.5) 1px, transparent 1px),
      linear-gradient(90deg, rgba(233, 236, 239, 0.5) 1px, transparent 1px);
    background-size: 20px 20px;
  }
  
  h1, h2, h3 {
    color: #2c3e50 !important;
    font-weight: 600;
  }
  
  .text-center {
    position: relative;
  }
  
  .consulting-shadow {
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
  }
---

# BMAD-METHOD™ for <br /> Product Owners

## 用 AI 重塑产品文档工作流

### 让竞品调研、需求设计、PRD 撰写、原型输出变得智能化

<div class="pt-12">
  <span @click="$slidev.nav.next" class="px-6 py-3 rounded cursor-pointer bg-blue-600 text-white hover:bg-blue-700 transition-colors font-medium" style="background: #1971c2">
    开始探索 <carbon:arrow-right class="inline"/>
  </span>
</div>

---
layout: two-cols
---

# 作为 PO，<br/> 您是否遇到过这些挑战？

::left::

## 📊 竞品调研

- 信息收集耗时耗力
- 分析维度不够全面
- 缺乏系统性对比方法

## 📝 需求设计

- 需求描述不够清晰
- 缺乏业务逻辑验证
- 需求优先级难以量化

::right::

## 📋 PRD 撰写

- 文档结构不一致
- 技术细节描述不准确
- 跨团队协作效率低

## 🎨 原型输出

- 原型与需求脱节
- 迭代周期过长
- 用户体验设计缺乏数据支撑

<div class="mt-8">
  <div class="text-xl font-bold" style="color: #495057">时间成本高 • 质量不稳定 • 协作困难</div>
</div>

---
layout: center
class: text-center
---

# 如果有一个 AI 团队能够协助您...

<div class="text-6xl mb-8">🤔</div>

## 让我们想象一下：

<div class="space-y-2 mt-6">
  <v-click>
    <div class="flex items-center space-x-2 px-3 py-2 rounded" style="background-color: #e7f5ff; border: 1px solid #4dabf7">
      <div class="w-8 h-8 rounded-full flex items-center justify-center flex-shrink-0" style="background-color: #1971c2">
        <div class="text-white text-xs font-bold">分</div>
      </div>
      <div class="flex-1">
        <div class="font-bold text-sm text-left" style="color: #2c3e50">AI 分析师</div>
        <div class="text-xs text-left" style="color: #495057">深度竞品调研，多维度分析功能、用户、商业模式</div>
      </div>
    </div>
  </v-click>
  
  <v-click>
    <div class="flex items-center space-x-2 px-3 py-2 rounded" style="background-color: #edf2ff; border: 1px solid #4c6ef5">
      <div class="w-8 h-8 rounded-full flex items-center justify-center flex-shrink-0" style="background-color: #364fc7">
        <div class="text-white text-xs font-bold">架</div>
      </div>
      <div class="flex-1">
        <div class="font-bold text-sm text-left" style="color: #2c3e50">AI 架构师</div>
        <div class="text-xs text-left" style="color: #495057">技术方案设计，系统架构、数据库、API 接口规范</div>
      </div>
    </div>
  </v-click>
  
  <v-click>
    <div class="flex items-center space-x-2 px-3 py-2 rounded" style="background-color: #e9ecef; border: 1px solid #adb5bd">
      <div class="w-8 h-8 rounded-full flex items-center justify-center flex-shrink-0" style="background-color: #495057">
        <div class="text-white text-xs font-bold">产</div>
      </div>
      <div class="flex-1">
        <div class="font-bold text-sm text-left" style="color: #2c3e50">AI 产品经理</div>
        <div class="text-xs text-left" style="color: #495057">专业 PRD 撰写，需求分析、用户故事、验收标准</div>
      </div>
    </div>
  </v-click>
  
  <v-click>
    <div class="flex items-center space-x-2 px-3 py-2 rounded" style="background-color: #e7f5ff; border: 1px solid #4dabf7">
      <div class="w-8 h-8 rounded-full flex items-center justify-center flex-shrink-0" style="background-color: #1971c2">
        <div class="text-white text-xs font-bold">开</div>
      </div>
      <div class="flex-1">
        <div class="font-bold text-sm text-left" style="color: #2c3e50">AI 开发专家</div>
        <div class="text-xs text-left" style="color: #495057">原型构建验证，快速开发、测试、迭代优化</div>
      </div>
    </div>
  </v-click>
</div>

<div class="mt-12">
  <div class="text-xl" style="color: #1971c2">这就是 <strong>BMAD-METHOD™</strong> 带给您的价值</div>
</div>

---

# BMAD-METHOD™ 核心价值

<div class="grid grid-cols-2 gap-8 mt-8">

<div class="p-6 rounded-lg consulting-shadow" style="background-color: #e7f5ff; border: 1.5px solid #4dabf7">
  <div class="text-2xl mb-4" style="color: #2c3e50">🎯 <strong>Agentic Planning</strong></div>
  <div class="text-sm" style="color: #495057">
    专业 AI 代理团队协作：
    <ul class="mt-2 space-y-1">
      <li><strong>Analyst</strong> - 市场调研与竞品分析</li>
      <li><strong>PM</strong> - 需求管理与 PRD 撰写</li>
      <li><strong>Architect</strong> - 技术方案设计</li>
    </ul>
  </div>
</div>

<div class="p-6 rounded-lg consulting-shadow" style="background-color: #e9ecef; border: 1.5px solid #adb5bd">
  <div class="text-xl mb-4" style="color: #2c3e50">⚡ <strong>Context-Engineered Development</strong></div>
  <div class="text-sm" style="color: #495057">
    智能上下文工程：
    <ul class="mt-2 space-y-1">
      <li>详细计划自动转换为开发故事</li>
      <li>保持完整项目上下文</li>
      <li>消除信息传递损失</li>
    </ul>
  </div>
</div>

</div>

<div class="mt-8 text-center">
  <div class="text-lg" style="color: #495057">解决传统 AI 辅助开发的两大痛点：<strong>规划不一致</strong> + <strong>上下文丢失</strong></div>
</div>

---

# 📋 完整工作流程：两阶段开发模式

<div class="grid grid-cols-2 gap-8 mt-6">

<div class="p-6 rounded-lg consulting-shadow" style="background-color: #e7f5ff; border: 1.5px solid #4dabf7">
  <h3 class="text-xl font-bold mb-4" style="color: #1971c2">Phase 1: 规划与设计</h3>
  <div class="text-sm space-y-3">
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs" style="background-color: #1971c2">1</div>
      <div style="color: #495057"><code>*agent analyst</code> → 竞品调研</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs" style="background-color: #1971c2">2</div>
      <div style="color: #495057"><code>*agent pm</code> → 撰写 PRD</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs" style="background-color: #1971c2">3</div>
      <div style="color: #495057"><code>*agent ux-expert</code> → UI 设计</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs" style="background-color: #1971c2">4</div>
      <div style="color: #495057"><code>*agent architect</code> → 架构设计</div>
    </div>
  </div>
  <div class="mt-4 text-xs" style="color: #6c757d">
    <strong>环境：</strong>Web UI (Claude/Gemini)<br>
    <strong>时长：</strong>半天到 1 天<br>
    <strong>产出：</strong>完整的设计文档
  </div>
</div>

<div class="p-6 rounded-lg consulting-shadow" style="background-color: #e9ecef; border: 1.5px solid #adb5bd">
  <h3 class="text-xl font-bold mb-4" style="color: #495057">Phase 2: 开发与实现</h3>
  <div class="text-sm space-y-3">
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs" style="background-color: #495057">5</div>
      <div style="color: #495057"><code>*agent po</code> → 文档切分</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs" style="background-color: #495057">6</div>
      <div style="color: #495057"><code>*agent sm</code> → 创建用户故事</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs" style="background-color: #495057">7</div>
      <div style="color: #495057"><code>*agent dev</code> → 编写代码</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs" style="background-color: #495057">8</div>
      <div style="color: #495057"><code>*agent qa</code> → 质量审查</div>
    </div>
  </div>
  <div class="mt-4 text-xs" style="color: #6c757d">
    <strong>环境：</strong>IDE (VS Code + Claude Code)<br>
    <strong>时长：</strong>2-5 天（视项目规模）<br>
    <strong>产出：</strong>可运行的完整应用
  </div>
</div>

</div>

<div class="mt-8 text-center text-sm" style="color: #495057">
  <div class="p-3 rounded" style="background-color: #edf2ff; border: 1px solid #4c6ef5">
    <strong>关键要点：</strong>第 6-8 步需要循环执行，每个用户故事都要经过 SM 创建 → 您批准 → Dev 实现 → QA 审查 的完整流程
  </div>
</div>

---
layout: section
---

# 具体应用场景演示

让我们看看 BMAD 如何改善您的具体工作

---

# 竞品调研：3 分钟完成专业分析

<div class="grid grid-cols-2 gap-8 mt-6">

<div class="p-4 rounded" style="background-color: #e7f5ff; border: 1px solid #4dabf7">
  <h3 class="text-lg font-bold mb-3" style="color: #2c3e50">📝 操作步骤</h3>
  <div class="text-sm space-y-3">
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs font-bold" style="background-color: #1971c2">1</div>
      <div style="color: #2c3e50"><strong>启动代理</strong></div>
    </div>
    <div class="pl-8">
      <code>*agent analyst</code>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs font-bold" style="background-color: #1971c2">2</div>
      <div style="color: #2c3e50"><strong>执行分析</strong></div>
    </div>
    <div class="pl-8">
      <code>*create-competitor-analysis</code>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs font-bold" style="background-color: #1971c2">3</div>
      <div style="color: #2c3e50"><strong>输入产品概念</strong></div>
    </div>
    <div class="pl-8" style="color: #495057">
      短视频应用，分析抖音、快手、小红书
    </div>
  </div>
</div>

<div class="p-4 rounded" style="background-color: #e9ecef; border: 1px solid #adb5bd">
  <h3 class="text-lg font-bold mb-3" style="color: #2c3e50">自动输出</h3>
  <div class="text-sm space-y-2">
    <div class="flex items-center space-x-2">
      <div class="w-2 h-2 rounded-full flex-shrink-0" style="background-color: #1971c2"></div>
      <div style="color: #495057"><strong>功能矩阵对比表</strong>（39 个功能点）</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-2 h-2 rounded-full flex-shrink-0" style="background-color: #4c6ef5"></div>
      <div style="color: #495057"><strong>精准用户画像</strong>分析</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-2 h-2 rounded-full flex-shrink-0" style="background-color: #adb5bd"></div>
      <div style="color: #495057"><strong>商业模式</strong>深度解析</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-2 h-2 rounded-full flex-shrink-0" style="background-color: #495057"></div>
      <div style="color: #495057"><strong>技术架构</strong>推测</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-2 h-2 rounded-full flex-shrink-0" style="background-color: #364fc7"></div>
      <div style="color: #495057"><strong>市场趋势</strong>预测分析</div>
    </div>
  </div>
  <div class="mt-4 text-center">
    <div class="inline-flex items-center space-x-1 px-3 py-1 rounded-full" style="background-color: #f8f9fa; border: 1px solid #e9ecef">
      <div class="text-xs font-bold" style="color: #2c3e50">⚡ 3-30 分钟</div>
      <div class="text-xs" style="color: #6c757d">vs</div>
      <div class="text-xs" style="color: #6c757d">传统 3-5 天</div>
    </div>
  </div>
</div>

</div>

---

# PRD 撰写：从空白页面到专业文档

## 实战演练：10 分钟完成一份 PRD

<div class="grid grid-cols-2 gap-8 mt-6">

<div class="p-4 rounded" style="background-color: #e7f5ff; border: 1px solid #4dabf7">
  <h3 class="font-bold mb-3" style="color: #2c3e50">操作步骤</h3>
  <div class="text-sm space-y-3">
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs font-bold" style="background-color: #1971c2">1</div>
      <div style="color: #2c3e50"><strong>启动代理</strong></div>
    </div>
    <div class="pl-8">
      <code>*agent pm</code>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs font-bold" style="background-color: #1971c2">2</div>
      <div style="color: #2c3e50"><strong>创建 PRD</strong></div>
    </div>
    <div class="pl-8">
      <code>*create-prd</code>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 text-white rounded-full flex items-center justify-center text-xs font-bold" style="background-color: #1971c2">3</div>
      <div style="color: #2c3e50"><strong>输入需求</strong></div>
    </div>
    <div class="pl-8" style="color: #495057">
      智能请假系统，移动端优先，支持审批流程，集成企业微信
    </div>
  </div>
</div>

<div class="p-4 rounded" style="background-color: #e9ecef; border: 1px solid #adb5bd">
  <h3 class="font-bold mb-3" style="color: #2c3e50">自动输出</h3>
  <div class="text-sm space-y-2">
    <div class="flex items-center space-x-2">
      <div class="w-4 h-4 rounded flex items-center justify-center flex-shrink-0" style="background-color: #1971c2">
        <div class="text-white text-xs">✓</div>
      </div>
      <div style="color: #495057">产品概述与用户画像</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-4 h-4 rounded flex items-center justify-center flex-shrink-0" style="background-color: #4c6ef5">
        <div class="text-white text-xs">✓</div>
      </div>
      <div style="color: #495057">23 个详细功能点</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-4 h-4 rounded flex items-center justify-center flex-shrink-0" style="background-color: #495057">
        <div class="text-white text-xs">✓</div>
      </div>
      <div style="color: #495057">As-Want-So 用户故事</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-4 h-4 rounded flex items-center justify-center flex-shrink-0" style="background-color: #364fc7">
        <div class="text-white text-xs">✓</div>
      </div>
      <div style="color: #495057">可测试的验收标准</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-4 h-4 rounded flex items-center justify-center flex-shrink-0" style="background-color: #adb5bd">
        <div class="text-white text-xs">✓</div>
      </div>
      <div style="color: #495057">技术要求与约束</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-4 h-4 rounded flex items-center justify-center flex-shrink-0" style="background-color: #1971c2">
        <div class="text-white text-xs">✓</div>
      </div>
      <div style="color: #495057">3 个版本迭代计划</div>
    </div>
  </div>
  <div class="mt-3 text-xs text-center" style="color: #6c757d">
    <span class="px-2 py-1 rounded" style="background-color: #f8f9fa; border: 1px solid #e9ecef">📁 docs/prd.md + architecture.md + user-stories/</span>
  </div>
</div>

</div>

---

# 完整开发流程：从 PRD 到可运行代码

## 案例：请假系统开发全流程

<div class="grid grid-cols-3 gap-6 mt-6">

<div class="p-4 rounded" style="background-color: #e7f5ff; border: 1px solid #4dabf7">
  <h3 class="font-bold mb-3" style="color: #1971c2">Phase 1: 架构设计</h3>
  <div class="text-sm space-y-2" style="color: #495057">
    <div><code>*agent architect</code> → <code>*create-full-stack-architecture</code></div>
    <div><strong>技术栈</strong>：React Native + Node.js + MongoDB</div>
    <div><strong>15 分钟输出</strong>：系统架构图、数据库设计、API 规范、安全方案</div>
  </div>
</div>

<div class="p-4 rounded" style="background-color: #e9ecef; border: 1px solid #adb5bd">
  <h3 class="font-bold mb-3" style="color: #495057">Phase 2: 开发实现</h3>
  <div class="text-sm space-y-2" style="color: #495057">
    <div><code>*agent po</code> → <code>*agent sm</code> → <code>*agent dev</code></div>
    <div><strong>循环执行</strong>：故事创建 → 您批准 → 开发实现</div>
  </div>
</div>

<div class="p-4 rounded" style="background-color: #edf2ff; border: 1px solid #4c6ef5">
  <h3 class="font-bold mb-3" style="color: #364fc7">最终交付</h3>
  <div class="text-sm space-y-2">
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 rounded-full flex items-center justify-center flex-shrink-0" style="background-color: #1971c2">
        <div class="text-white text-xs">📱</div>
      </div>
      <div style="color: #495057">移动应用 (APK)</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 rounded-full flex items-center justify-center flex-shrink-0" style="background-color: #4c6ef5">
        <div class="text-white text-xs">💻</div>
      </div>
      <div style="color: #495057">管理后台</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 rounded-full flex items-center justify-center flex-shrink-0" style="background-color: #364fc7">
        <div class="text-white text-xs">🔌</div>
      </div>
      <div style="color: #495057">完整 API 服务</div>
    </div>
    <div class="flex items-center space-x-2">
      <div class="w-6 h-6 rounded-full flex items-center justify-center flex-shrink-0" style="background-color: #495057">
        <div class="text-white text-xs">📚</div>
      </div>
      <div style="color: #495057">技术文档</div>
    </div>
  </div>
  <div class="mt-4 text-center">
    <div class="inline-flex items-center space-x-2 text-white px-4 py-2 rounded-full text-xs font-bold" style="background-color: #1971c2">
      <div>⚡</div>
      <div>3 天 vs 传统 3-4 周</div>
    </div>
  </div>
</div>

</div>

---
layout: center
class: text-center
---

# 三种入门方式，现在就开始

<div class="grid grid-cols-3 gap-6 mt-6">

<div class="p-4 rounded" style="background-color: #e7f5ff; border: 1px solid #4dabf7">
  <h3 class="text-lg font-bold mb-3" style="color: #1971c2">2 分钟体验</h3>
  <div class="text-sm space-y-2 text-left" style="color: #495057">
    <div class="text-center"><strong>新手</strong></div>
    <div>1. 打开 Claude/Gemini</div>
    <div>2. 创建 Project/Gem，<br/>上传 <code>team-fullstack.txt</code></div>
    <div>3. 进入 <code>*agent analyst</code></div>
    <div>4. 输入 <code>你的分析主题</code></div>
    <div class="text-xs mt-3" style="color: #6c757d">无需安装，立即体验</div>
  </div>
</div>

<div class="p-4 rounded" style="background-color: #e9ecef; border: 1px solid #adb5bd">
  <h3 class="text-lg font-bold mb-3" style="color: #495057">完整安装</h3>
  <div class="text-sm space-y-2 text-left" style="color: #495057">
    <div class="text-center"><strong>开发者</strong></div>
    <div class="p-2 rounded font-mono text-xs" style="background-color: #2c3e50; color: #1dd1a1">
      npx bmad-method install
    </div>
    <div>获得工作流自动化、模板系统、质量检查等完整功能</div>
    <div class="text-xs mt-3" style="color: #6c757d">Claude Code <code>/BMad:</code> 命令拥有最好的体验</div>
  </div>
</div>

<div class="p-4 rounded" style="background-color: #edf2ff; border: 1px solid #4c6ef5">
  <h3 class="text-lg font-bold mb-3" style="color: #364fc7">内部协作</h3>
  <div class="text-sm space-y-2 text-left" style="color: #495057">
    <div class="text-center"><strong>团队</strong></div>
    <div>• 产品管理最佳实践</div>
    <div>• BMAD 实操训练</div>
    <div>• 真实项目演练</div>
    <div>• 团队流程定制</div>
    <div class="text-xs mt-2" style="color: #6c757d">交流微信：Trendible</div>
  </div>
</div>

</div>

---

# 资源清单和下一步行动

<div class="grid grid-cols-2 gap-6 mt-6">

<div class="p-4 rounded" style="background-color: #e7f5ff; border: 1px solid #4dabf7">
  <h3 class="text-lg font-bold mb-3" style="color: #1971c2">立即开始（5 分钟）</h3>
  <div class="space-y-2 text-sm" style="color: #495057">
    <div class="p-2 rounded font-mono text-xs" style="background-color: #2c3e50; color: #1dd1a1">
      npx bmad-method install
    </div>
    <div>📱 <strong>演示视频</strong>：https://youtube.com/@BMadCode</div>
    <div>📖 <strong>快速指南</strong>：docs/user-guide.md</div>
    <div>💬 <strong>Discord 群</strong>：https://discord.gg/gk8jAdXWmj</div>
    <div>📧 <strong>技术支持</strong>：github.com/bmadcode</div>
  </div>
</div>

<div class="p-4 rounded" style="background-color: #e9ecef; border: 1px solid #adb5bd">
  <h3 class="text-lg font-bold mb-3" style="color: #495057">检查清单</h3>
  <div class="space-y-2 text-sm" style="color: #495057">
    <div>☐ 下载演示文稿到本地</div>
    <div>☐ 在测试项目中安装 BMAD</div>
    <div>☐ 体验 Analyst 代理（竞品分析）</div>
    <div>☐ 尝试 PM 代理（撰写简单 PRD）</div>
    <div>☐ 加入用户社群获取支持</div>
    <div>☐ 分享给团队其他成员</div>
  </div>
</div>

</div>

<div class="mt-8 text-center">
  <div class="text-xl font-bold mb-2" style="color: #2c3e50">🚀 开始您的 AI 驱动产品管理之旅</div>
  <div class="text-sm" style="color: #6c757d">现在就动手试试，体验效率提升吧！</div>
</div>

---
layout: end
---

# 感谢聆听

<div class="text-center mt-16">
  <div class="text-3xl mb-4">🚀</div>
  <div class="text-xl" style="color: #2c3e50">
    <strong>BMAD-METHOD™</strong><br/>
    让 AI 成为您最得力的产品管理助手
  </div>
  
  <div class="mt-8" style="color: #6c757d">
    Questions & Discussion
  </div>
</div>
