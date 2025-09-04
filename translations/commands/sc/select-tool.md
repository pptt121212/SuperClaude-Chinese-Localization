---
name: select-tool
description: "选择和配置最适合当前任务的工具和方法"
category: special
complexity: high
mcp-servers: [serena, morphllm]
personas: []
---

# /sc:select-tool - 选择和配置最适合当前任务的工具和方法

## 触发器
- 需要在Serena和Morphllm之间进行最佳MCP工具选择的操作
- 需要复杂度分析和能力匹配的元系统决策
- 需要性能vs准确性权衡的工具路由决策
- 受益于智能工具能力评估的操作

## 用法
```
/sc:select-tool [操作] [--analyze] [--explain]
```

## 行为流程
1. **解析**: 分析操作类型、范围、文件数量和复杂度指标
2. **评分**: 应用跨各种操作因素的多维复杂度评分
3. **匹配**: 将操作要求与Serena和Morphllm能力进行比较
4. **选择**: 基于评分矩阵和性能要求选择最佳工具
5. **验证**: 验证选择准确性并提供置信度指标

关键行为：
- 基于文件数量、操作类型、语言和框架要求的复杂度评分
- 评估速度vs准确性权衡以进行最佳选择的性能评估
- 具有直接映射和基于阈值的路由规则的决策逻辑矩阵
- Serena（语义操作）vs Morphllm（模式操作）的工具能力匹配

## MCP集成
- **Serena MCP**: 最适合语义操作、LSP功能、符号导航和项目上下文
- **Morphllm MCP**: 最适合基于模式的编辑、批量转换和速度关键操作
- **决策矩阵**: 基于复杂度评分和操作特征的智能路由

## 工具协调
- **get_current_config**: 用于工具能力评估的系统配置分析
- **execute_sketched_edit**: 操作测试和选择准确性验证
- **读/Grep**: 操作上下文分析和复杂度因素识别
- **集成**: 由refactor、edit、implement和improve命令使用的自动选择逻辑

## 关键模式
- **直接映射**: 符号操作 → Serena，模式编辑 → Morphllm，内存操作 → Serena
- **复杂度阈值**: 评分>0.6 → Serena，评分<0.4 → Morphllm，0.4-0.6 → 基于功能
- **性能权衡**: 速度要求 → Morphllm，准确性要求 → Serena
- **回退策略**: Serena → Morphllm → 本地工具降级链

## 示例

### 复杂重构操作
```
/sc:select-tool "在10个文件中重命名函数" --analyze
# 分析：高复杂度（多文件、符号操作）
# 选择：Serena MCP（LSP能力、语义理解）
```

### 基于模式的批量编辑
```
/sc:select-tool "在整个项目中将console.log更新为logger.info" --explain
# 分析：基于模式的转换，速度优先
# 选择：Morphllm MCP（模式匹配、批量操作）
```

### 内存管理操作
```
/sc:select-tool "保存项目上下文和发现"
# 直接映射：内存操作 → Serena MCP
# 基本原理：项目上下文和跨会话持久性
```

## 边界

**将会：**
- 分析操作并在Serena和Morphllm之间提供最佳工具选择
- 基于文件数量、操作类型和要求应用复杂度评分
- 提供亚100ms决策时间和>95%选择准确性

**将不会：**
- 当用户有明确偏好时覆盖显式工具规范
- 在没有适当复杂度分析和能力匹配的情况下选择工具
- 为便利性或速度而妥协性能要求