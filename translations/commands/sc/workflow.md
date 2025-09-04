---
name: workflow
description: "设计和优化工作流程，提高团队协作效率"
category: orchestration
complexity: advanced
mcp-servers: [sequential, context7, magic, playwright, morphllm, serena]
personas: [architect, analyzer, frontend, backend, security, devops, project-manager]
---

# /sc:workflow - 设计和优化工作流程，提高团队协作效率

## 触发器
- PRD和功能规格分析以进行实施规划
- 开发项目的结构化工作流程生成
- 复杂实施策略的多角色协调
- 跨会话工作流程管理和依赖映射

## 用法
```
/sc:workflow [prd文件|功能描述] [--strategy systematic|agile|enterprise] [--depth shallow|normal|deep] [--parallel]
```

## 行为流程
1. **分析**: 解析PRD和功能规格以理解实施要求
2. **规划**: 生成具有依赖映射和任务编排的综合工作流程结构
3. **协调**: 激活多个角色以获得领域专业知识和实施策略
4. **执行**: 创建具有自动任务协调的结构化分步工作流程
5. **验证**: 应用质量门禁并确保跨领域的工作流程完整性

关键行为：
- 跨架构、前端、后端、安全和devops领域的多角色编排
- 高级MCP协调，具有专门工作流程分析的智能路由
- 具有渐进式工作流程增强和并行处理的系统执行
- 具有全面依赖跟踪的跨会话工作流程管理

## MCP集成
- **Sequential MCP**: 复杂多步工作流程分析和系统实施规划
- **Context7 MCP**: 框架特定工作流程模式和实施最佳实践
- **Magic MCP**: UI/UX工作流程生成和设计系统集成策略
- **Playwright MCP**: 测试工作流程集成和质量保证自动化
- **Morphllm MCP**: 大规模工作流程转换和基于模式的优化
- **Serena MCP**: 跨会话工作流程持久性、内存管理和项目上下文

## 工具协调
- **读/写/编辑**: PRD分析和工作流程文档生成
- **TodoWrite**: 复杂多阶段工作流程执行的进度跟踪
- **任务**: 并行工作流程生成和多代理协调的高级委托
- **WebSearch**: 技术研究、框架验证和实施策略分析
- **sequentialthinking**: 复杂工作流程依赖分析的结构化推理

## 关键模式
- **PRD分析**: 文档解析 → 需求提取 → 实施策略开发
- **工作流程生成**: 任务分解 → 依赖映射 → 结构化实施规划
- **多领域协调**: 跨职能专业知识 → 综合实施策略
- **质量集成**: 工作流程验证 → 测试策略 → 部署规划

## 示例

### 系统化PRD工作流程
```
/sc:workflow ClaudeDocs/PRD/feature-spec.md --strategy systematic --depth deep
# 具有系统化工作流程生成的综合PRD分析
# 完整实施策略的多角色协调
```

### 敏捷功能工作流程
```
/sc:workflow "用户认证系统" --strategy agile --parallel
# 具有并行任务协调的敏捷工作流程生成
# 框架和UI工作流程模式的Context7和Magic MCP
```

### 企业实施规划
```
/sc:workflow enterprise-prd.md --strategy enterprise --validate
# 具有全面验证的企业级工作流程
# 合规性和可扩展性的安全、devops和架构师角色
```

### 跨会话工作流程管理
```
/sc:workflow project-brief.md --depth normal
# Serena MCP管理跨会话工作流程上下文和持久性
# 具有内存驱动洞察的渐进式工作流程增强
```

## 边界

**将会：**
- 从PRD和功能规格生成综合实施工作流程
- 协调多个角色和MCP服务器以获得完整实施策略
- 提供跨会话工作流程管理和渐进增强功能

**将不会：**
- 执行超出工作流程规划和策略的实际实施任务
- 在没有适当分析和验证的情况下覆盖既定开发流程
- 在没有全面需求分析和依赖映射的情况下生成工作流程