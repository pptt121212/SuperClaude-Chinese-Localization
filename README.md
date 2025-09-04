# SuperClaude Chinese Localization

<div align="center">

![SuperClaude Logo](https://img.shields.io/badge/SuperClaude-Chinese%20Localization-blue?style=for-the-badge&logo=github&logoColor=white)

**🚀 SuperClaude 无侵入式汉化工具**
**🔧 一键安装，安全备份，完整汉化**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/pptt121212/SuperClaude-Chinese-Localization?style=social)](https://github.com/pptt121212/SuperClaude-Chinese-Localization)
[![GitHub forks](https://img.shields.io/github/forks/pptt121212/SuperClaude-Chinese-Localization?style=social)](https://github.com/pptt121212/SuperClaude-Chinese-Localization)

</div>

## 📖 项目简介

SuperClaude Chinese Localization 是一个专为 SuperClaude 设计的无侵入式汉化工具。它提供完整的中文界面翻译，包括命令描述、代理文档、模式说明、MCP 服务器文档等，同时支持一键备份和恢复功能。

### 🏢 原版项目
本项目基于 [SuperClaude Framework](https://github.com/SuperClaude-Org/SuperClaude_Framework) 开发，是 SuperClaude 的官方汉化版本。

## ✨ 主要特性

- 🎯 **无侵入式汉化** - 保持原有功能，仅替换界面文本
- 🔒 **安全备份** - 自动创建完整备份，支持一键恢复
- 🚀 **一键安装** - 单个命令完成所有安装步骤
- 🎨 **交互界面** - 友好的用户界面，实时进度显示
- 📦 **完整覆盖** - 汉化所有组件：命令、代理、模式、MCP、核心文件
- 🔄 **持续更新** - 支持 Git 更新，获取最新汉化内容
- 🛡️ **错误处理** - 完善的错误检测和恢复机制

## 📋 支持的汉化内容

### 🎮 内置命令
- `/sc:index` - 索引和搜索
- `/sc:analyze` - 代码分析
- `/sc:build` - 构建和编译
- `/sc:document` - 文档生成
- `/sc:test` - 测试相关
- `/sc:git` - Git 操作
- `/sc:task` - 任务管理
- `/sc:design` - 设计模式
- `/sc:workflow` - 工作流程
- 等等...

### 🤖 代理系统
- Python Expert - Python 专家
- Requirements Analyst - 需求分析师
- Root Cause Analyst - 根因分析师
- Socratic Mentor - 苏格拉底导师
- Learning Guide - 学习指南
- Refactoring Expert - 重构专家
- Performance Engineer - 性能工程师
- Quality Engineer - 质量工程师
- Backend Architect - 后端架构师
- Frontend Architect - 前端架构师
- System Architect - 系统架构师
- Technical Writer - 技术文档工程师
- DevOps Architect - DevOps 架构师
- Security Engineer - 安全工程师

### 🧠 行为模式
- Brainstorming Mode - 头脑风暴模式
- Introspection Mode - 内省模式
- Orchestration Mode - 编排模式
- Task Management Mode - 任务管理模式
- Token Efficiency Mode - 令牌效率模式

### 🔧 MCP 服务器
- Context7 MCP - 官方文档查找
- Magic MCP - UI 组件生成
- Morphllm MCP - 模式化代码编辑
- Playwright MCP - 浏览器自动化
- Sequential MCP - 多步推理
- Serena MCP - 语义代码理解

### 📚 核心文档
- FLAGS.md - 行为标志
- PRINCIPLES.md - 软件工程原则
- RULES.md - 行为规则
- CLAUDE.md - 框架组件

## 🚀 快速安装

### 方法一：一键安装（推荐）
```bash
curl -sSL https://raw.githubusercontent.com/pptt121212/SuperClaude-Chinese-Localization/main/install.sh | bash
```

**安装完成后，脚本会自动显示后续操作指引，包括：**
- 🚀 推荐方式：`superclaude-localize`（启动交互式界面）
- ⚡ 快速操作：`superclaude-localize -i`（直接安装汉化）
- 🔍 检查状态：`superclaude-localize -c`（检查系统状态）
- 📚 查看帮助：`superclaude-localize -h`（显示所有选项）

### 方法二：手动安装
```bash
# 克隆仓库
git clone https://github.com/pptt121212/SuperClaude-Chinese-Localization.git
cd SuperClaude-Chinese-Localization

# 运行安装脚本
chmod +x install.sh
./install.sh
```

**安装完成后，你可以：**
- 在终端模式下，脚本会询问是否立即启动汉化工具
- 输入 `y` 直接启动交互式界面
- 输入 `N` 跳过，稍后手动运行

### 方法三：直接使用
```bash
# 克隆仓库
git clone https://github.com/pptt121212/SuperClaude-Chinese-Localization.git
cd SuperClaude-Chinese-Localization

# 直接运行汉化脚本
chmod +x localize.sh
./localize.sh
```

**这种方式会立即启动交互式界面，无需安装步骤。**

## 📖 使用方法

### 交互式模式（推荐）
```bash
superclaude-localize
```
或者
```bash
~/SuperClaude-Chinese-Localization/localize.sh
```

**启动后你会看到：**
```
=== SuperClaude 汉化工具 v1.0.0 ===

请选择操作:
1. 查看系统状态
2. 查看汉化预览
3. 开始汉化
4. 取消汉化
5. 退出

请输入选项 [1-5]:
```

**推荐操作流程：**
1. 选择 `1` 查看系统状态
2. 选择 `2` 查看汉化预览
3. 选择 `3` 开始汉化

### 命令行模式
```bash
# 直接安装汉化（一键完成，无需交互）
superclaude-localize -i

# 恢复原始状态（一键恢复到原始状态）
superclaude-localize -r

# 仅创建备份（创建备份但不汉化）
superclaude-localize -b

# 检查系统状态（查看SuperClaude和汉化状态）
superclaude-localize -c

# 显示帮助信息（查看所有可用选项）
superclaude-localize -h

# 显示版本信息
superclaude-localize -v
```

**推荐使用场景：**
- `-i`: 首次安装或重新汉化
- `-c`: 检查当前状态和问题排查
- `-r`: 遇到问题需要恢复时
- `-h`: 不确定如何使用时

### 界面预览

交互式界面提供以下功能：

**🔍 系统检查**
1. **查看系统状态** - 检查 SuperClaude 安装和汉化状态
   - 显示SuperClaude安装路径
   - 显示当前汉化状态
   - 检查备份文件情况

**📋 汉化管理**
2. **查看汉化预览** - 预览将要汉化的内容
   - 显示将要修改的文件列表
   - 显示翻译内容预览
3. **开始汉化** - 一键完成所有汉化操作
   - 自动创建备份
   - 实时显示进度
   - 完成后显示摘要
4. **取消汉化** - 恢复到原始状态
   - 选择备份版本恢复
   - 自动清理临时文件

**🛡️ 安全退出**
5. **退出程序** - 安全退出，保存所有设置

## 🔧 系统要求

### 必需组件
- **SuperClaude** - 已正确安装的 SuperClaude
- **Git** - 版本控制工具
- **Bash** - shell 环境
- **Curl** - 网络下载工具

### 支持的系统
- Linux (Ubuntu, CentOS, Debian, etc.)
- macOS
- Windows (WSL2)

## 📁 项目结构

```
SuperClaude-Chinese-Localization/
├── localize.sh              # 主汉化脚本
├── install.sh               # 快速安装脚本
├── README.md                # 项目说明文档
├── .gitignore               # Git 忽略文件
├── translations/            # 翻译文件目录
│   ├── commands/            # 命令翻译
│   │   └── sc/              # 内置命令
│   ├── agents/              # 代理翻译
│   ├── modes/               # 模式翻译
│   ├── mcp/                 # MCP 服务器翻译
│   ├── core/                # 核心文件翻译
│   └── claude-code/         # Claude Code 核心包翻译
└── backup/                  # 备份文件目录
```

## 🛡️ 安全机制

### 备份机制
- **完整备份** - 自动备份所有原始文件
- **时间戳标记** - 备份文件包含创建时间
- **校验和验证** - 备份时创建文件校验和
- **增量备份** - 仅备份已更改的文件

### 恢复机制
- **一键恢复** - 单个命令恢复所有文件
- **选择性恢复** - 可选择特定备份进行恢复
- **自动清理** - 恢复后自动清理临时文件
- **完整性检查** - 恢复前验证备份完整性

### 错误处理
- **预检查** - 操作前检查系统状态
- **错误提示** - 详细的错误信息和解决建议
- **安全中断** - 操作出错时安全停止
- **日志记录** - 详细的操作日志

## 🔄 更新方法

### 方法一：重新安装
```bash
curl -sSL https://raw.githubusercontent.com/pptt121212/SuperClaude-Chinese-Localization/main/install.sh | bash
```

### 方法二：Git 更新
```bash
cd ~/SuperClaude-Chinese-Localization
git pull origin main
```

## 🐛 常见问题

### Q: 汉化后 SuperClaude 无法启动？
A: 请检查是否有备份文件，运行恢复命令：
```bash
superclaude-localize -r
```
如果问题仍然存在，可以：
1. 运行 `superclaude-localize -c` 检查系统状态
2. 查看备份文件是否存在
3. 手动恢复特定备份文件

### Q: 如何知道是否已汉化？
A: 运行状态检查命令：
```bash
superclaude-localize -c
```
会显示详细的系统状态和汉化情况。

### Q: 可以部分汉化吗？
A: 目前不支持部分汉化，建议完整安装以确保兼容性。
完整汉化包括：
- 命令描述汉化
- 代理文档汉化
- 模式说明汉化
- MCP服务器文档汉化
- 核心文件汉化

### Q: 汉化后如何更新？
A: 有两种更新方式：
**方式一：重新安装**
```bash
curl -sSL https://raw.githubusercontent.com/pptt121212/SuperClaude-Chinese-Localization/main/install.sh | bash
```
**方式二：Git更新**
```bash
cd ~/SuperClaude-Chinese-Localization
git pull origin main
```

### Q: 备份文件占用空间太大？
A: 可以手动清理旧备份文件：
```bash
# 查看所有备份
ls -la ~/SuperClaude-Chinese-Localization.backup.*

# 删除旧备份（保留最新的1-2个）
rm -rf ~/SuperClaude-Chinese-Localization.backup.旧日期
```

### Q: 安装后命令找不到？
A: 请确保 `~/.local/bin` 在PATH中：
```bash
# 添加到PATH（临时）
export PATH="$HOME/.local/bin:$PATH"

# 添加到PATH（永久，添加到 ~/.bashrc）
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 🤝 贡献指南

我们欢迎任何形式的贡献！

### 贡献方式
1. **改进翻译** - 修正翻译错误或改进表达
2. **新增功能** - 添加新的汉化内容或功能
3. **报告问题** - 提交 Bug 报告或功能请求
4. **完善文档** - 改进项目文档

### 贡献流程
1. Fork 本仓库
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

### 开发环境设置
```bash
# 克隆仓库
git clone https://github.com/pptt121212/SuperClaude-Chinese-Localization.git
cd SuperClaude-Chinese-Localization

# 创建开发分支
git checkout -b dev

# 设置执行权限
chmod +x localize.sh install.sh
```

## 📄 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件。

## 🙏 致谢

- 感谢 [SuperClaude Framework](https://github.com/SuperClaude-Org/SuperClaude_Framework) 团队提供优秀的 AI 助手框架
- 感谢原版项目开发者的辛勤工作和开源贡献
- 感谢所有汉化贡献者的翻译和优化工作
- 感谢社区用户的反馈和支持

## 🔗 相关链接

### 🏢 原版项目
- **SuperClaude Framework**: https://github.com/SuperClaude-Org/SuperClaude_Framework
- **原版文档**: https://github.com/SuperClaude-Org/SuperClaude_Framework

### 📋 汉化项目
- **GitHub仓库**: https://github.com/pptt121212/SuperClaude-Chinese-Localization
- **在线文档**: https://github.com/pptt121212/SuperClaude-Chinese-Localization/blob/main/README.md
- **问题反馈**: https://github.com/pptt121212/SuperClaude-Chinese-Localization/issues

## 📞 联系我们

- 📧 Email: your.email@example.com
- 💬 Issues: [GitHub Issues](https://github.com/pptt121212/SuperClaude-Chinese-Localization/issues)
- 🐙 Twitter: [@yourusername](https://twitter.com/yourusername)

---

<div align="center">

**如果这个项目对你有帮助，请给我们一个 ⭐️ Star**

[![Star History Chart](https://api.star-history.com/svg?repos=yourusername/SuperClaude-Chinese-Localization&type=Date)](https://star-history.com/#yourusername/SuperClaude-Chinese-Localization&Date)

</div>