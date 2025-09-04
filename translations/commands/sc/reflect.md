---
name: reflect
description: "反思决策过程，总结经验教训和改进点"
category: special
complexity: standard
mcp-servers: [serena]
personas: []
---

# /sc:reflect - 反思决策过程，总结经验教训和改进点

## 触发器
- 需要验证和质量评估的任务完成
- 会话进度分析和已完成工作的反思
- 项目改进的跨会话学习和洞察捕获
- 需要全面任务遵守验证的质量门禁

## 用法
```
/sc:reflect [--type task|session|completion] [--analyze] [--validate]
```

## 行为流程
1. **分析**: 使用Serena反思工具检查当前任务状态和会话进度
2. **验证**: 评估任务遵守性、完成质量和需求满足度
3. **反思**: 应用对收集信息和会话洞察的深度分析
4. **文档**: 更新会话元数据并捕获学习洞察
5. **优化**: 提供流程改进和质量增强的建议

关键行为：
- Serena MCP集成用于综合反思分析和任务验证
- TodoWrite模式和高级Serena分析能力之间的桥梁
- 会话生命周期集成，具有跨会话持久性和学习捕获
- 性能关键操作，<200ms核心反思和验证

## MCP集成
- **Serena MCP**: 反思分析、任务验证和会话元数据的强制性集成
- **反思工具**: think_about_task_adherence、think_about_collected_information、think_about_whether_you_are_done
- **内存操作**: 具有read_memory、write_memory、list_memories的跨会话持久性
- **性能关键**: 核心反思操作<200ms，检查点创建<1s

## 工具协调
- **TodoRead/TodoWrite**: 传统任务管理和高级反思分析之间的桥梁
- **think_about_task_adherence**: 针对项目目标和会话目标验证当前方法
- **think_about_collected_information**: 分析会话工作和信息收集完整性
- **think_about_whether_you_are_done**: 评估任务完成标准和剩余工作识别
- **内存工具**: 会话元数据更新和跨会话学习捕获

## 关键模式
- **任务验证**: 当前方法 → 目标一致性 → 偏差识别 → 课程修正
- **会话分析**: 信息收集 → 完整性评估 → 质量评估 → 洞察捕获
- **完成评估**: 进度评估 → 完成标准 → 剩余工作 → 决策验证
- **跨会话学习**: 反思洞察 → 内存持久性 → 增强项目理解

## 示例

### 任务遵守性反思
```
/sc:reflect --type task --analyze
# 针对项目目标验证当前方法
# 识别偏差并提供课程修正建议
```

### 会话进度分析
```
/sc:reflect --type session --validate
# 会话工作和信息收集的综合分析
# 项目改进的质量评估和差距识别
```

### 完成验证
```
/sc:reflect --type completion
# 针对实际进度评估任务完成标准
# 确定任务完成准备就绪并识别剩余障碍
```

## 边界

**将会：**
- 使用Serena MCP分析工具执行综合任务反思和验证
- 将TodoWrite模式与高级反思能力桥接以增强任务管理
- 提供跨会话学习捕获和会话生命周期集成

**将不会：**
- 在没有适当Serena MCP集成和反思工具访问的情况下操作
- 在没有适当遵守性和质量验证的情况下覆盖任务完成决策
- 绕过会话完整性检查和跨会话持久性要求