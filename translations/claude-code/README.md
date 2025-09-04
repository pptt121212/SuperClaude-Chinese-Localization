# Claude Code

![](https://img.shields.io/badge/Node.js-18%2B-brightgreen?style=flat-square) [![npm]](https://www.npmjs.com/package/@anthropic-ai/claude-code)

[npm]: https://img.shields.io/npm/v/@anthropic-ai/claude-code.svg?style=flat-square

Claude Code 是一个智能编程工具，运行在你的终端中，能够理解你的代码库，并通过执行常规任务、解释复杂代码和处理 git 工作流程来帮助你更快地编码——所有这些都通过自然语言命令完成。你可以在终端、IDE 中使用它，或在 Github 上 @claude。

**在[官方文档](https://docs.anthropic.com/en/docs/claude-code/overview)中了解更多信息。**

<img src="https://github.com/anthropics/claude-code/blob/main/demo.gif?raw=1" />

## 开始使用

1. 安装 Claude Code：

```sh
npm install -g @anthropic-ai/claude-code
```

2. 导航到你的项目目录并运行 `claude`。

## 报告错误

在这个测试期间，我们欢迎反馈。使用 `/bug` 命令直接在 Claude Code 中报告问题，或提交 [GitHub issue](https://github.com/anthropics/claude-code/issues)。

## 数据收集、使用和保留

当你使用 Claude Code 时，我们会收集反馈，包括使用数据（如代码接受或拒绝）、相关的对话数据以及通过 `/bug` 命令提交的用户反馈。

### 我们如何使用你的数据

我们可能会使用反馈来改进我们的产品和服务，但我们不会使用来自 Claude Code 的反馈来训练生成模型。考虑到其潜在的敏感性，我们只将用户反馈记录存储 30 天。

如果你选择向我们发送关于 Claude Code 的反馈，例如你的使用记录，Anthropic 可能会使用该反馈来调试相关问题并改进 Claude Code 的功能（例如，以减少类似错误在未来发生的风险）。

### 隐私保护措施

我们已经实施了多项保护措施来保护你的数据，包括敏感信息的有限保留期、对用户会话数据的访问限制，以及禁止使用反馈进行模型训练的明确政策。

有关详细信息，请查看我们的[商业服务条款](https://www.anthropic.com/legal/commercial-terms)和[隐私政策](https://www.anthropic.com/legal/privacy)。