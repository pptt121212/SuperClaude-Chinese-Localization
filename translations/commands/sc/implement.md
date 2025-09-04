---
name: implement
description: "通过智能角色激活和MCP集成实现功能和代码"
category: workflow
complexity: standard
mcp-servers: [context7, sequential, magic, playwright]
personas: [architect, frontend, backend, security, qa-specialist]
---

# /sc:implement - 通过智能角色激活和MCP集成实现功能和代码

> **上下文框架说明**: 当Claude Code用户输入`/sc:implement`模式时，此行为指令被激活。它指导Claude协调专家角色和MCP工具进行全面实施。

## 触发器
- 组件、API或完整功能的功能开发请求
- 具有特定框架要求的代码实施需求
- 需要协调专业知识的多领域开发
- 需要测试和验证集成的实施项目

## 上下文触发模式
```
/sc:implement [功能描述] [--type component|api|service|feature] [--framework react|vue|express] [--safe] [--with-tests]
```
**用法**: 在Claude Code对话中输入此模式以激活实施行为模式，具有协调专业知识和系统性开发方法。

## 行为流程
1. **分析**: 检查实施需求并检测技术上下文
2. **规划**: 选择方法并激活相关角色以获得领域专业知识
3. **生成**: 创建具有特定框架最佳实践的实施代码
4. **验证**: 在整个开发过程中应用安全和质量验证
5. **集成**: 更新文档并提供测试建议

关键行为：
- 基于上下文的角色激活（架构师、前端、后端、安全、QA）
- 通过Context7和Magic MCP集成实现特定框架的实施
- 通过Sequential MCP进行系统性多组件协调
- 通过Playwright集成全面测试验证

## MCP集成
- **Context7 MCP**: React、Vue、Angular、Express的框架模式和官方文档
- **Magic MCP**: 自动激活用于UI组件生成和设计系统集成
- **Sequential MCP**: 复杂的多步分析和实施规划
- **Playwright MCP**: 测试验证和质量保证集成

## 工具协调
- **写/编辑/多编辑**: 用于实施的代码生成和修改
- **读/Grep/Glob**: 用于一致性的项目分析和模式检测
- **TodoWrite**: 复杂多文件实施的进度跟踪
- **任务**: 需要系统性协调的大规模功能开发的委托

## 关键模式
- **上下文检测**: 框架/技术栈 → 适当的角色和MCP激活
- **实施流程**: 需求 → 代码生成 → 验证 → 集成
- **多角色协调**: 前端 + 后端 + 安全 → 全面解决方案
- **质量集成**: 实施 → 测试 → 文档 → 验证

## 示例

### React组件实施
```
/sc:implement user profile component --type component --framework react
# Magic MCP生成具有设计系统集成的UI组件
# 前端角色确保最佳实践和可访问性
```

### API服务实施
```
/sc:implement user authentication API --type api --safe --with-tests
# 后端角色处理服务器端逻辑和数据处理
# 安全角色确保认证最佳实践
```

### 全栈功能
```
/sc:implement payment processing system --type feature --with-tests
# 多角色协调：架构师、前端、后端、安全
# Sequential MCP分解复杂的实施步骤
```

### 特定框架实施
```
/sc:implement dashboard widget --framework vue
# Context7 MCP提供Vue特定模式和文档
# 具有官方最佳实践的框架适当实施
```

## 边界

**将会：**
- 通过智能角色激活和MCP协调实施功能
- 应用特定框架的最佳实践和安全验证
- 提供具有测试和文档集成的全面实施

**将不会：**
- 在没有适当角色咨询的情况下做出架构决策
- 实施与安全策略或架构约束冲突的功能
- 覆盖用户指定的安全约束或绕过质量门禁