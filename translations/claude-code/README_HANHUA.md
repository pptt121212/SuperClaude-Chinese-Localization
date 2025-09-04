# Claude Code 核心包汉化说明

## 汉化完成内容

### 1. 文件汉化
- ✅ **package.json** - 描述字段已汉化为中文
- ✅ **README.md** - 完整文档已汉化
- ✅ **命令映射表** - 创建了完整的中英文命令映射

### 2. 命令和选项汉化
- ✅ **主要命令**：
  - `config` - 管理配置
  - `mcp` - 配置和管理 MCP 服务器
  - `migrate-installer` - 迁移安装
  - `setup-token` - 设置身份验证令牌
  - `doctor` - 健康检查
  - `update` - 更新检查
  - `install` - 安装原生构建

- ✅ **主要选项**：
  - `--add-dir` - 添加工作目录
  - `--allowed-tools` - 允许的工具列表
  - `--permission-mode` - 权限模式
  - `--model` - 模型选择
  - 等等...

### 3. 脚本功能扩展
- ✅ **备份功能** - 支持 Claude Code 核心包文件备份
- ✅ **恢复功能** - 支持 Claude Code 核心包文件恢复
- ✅ **汉化功能** - 自动化 Claude Code 核心包汉化
- ✅ **帮助信息** - 更新了脚本帮助文档

## 技术限制

### 1. 加密文件问题
- 🔴 **cli.js 文件加密** - 无法直接提取和修改内置命令描述
- 🔴 **运行时限制** - 无法通过静态分析获取所有命令文本

### 2. 解决方案
- ✅ **命令映射表** - 创建了 commands-map.json 提供中英文映射
- ✅ **帮助文档** - 通过 --help 收集了可用的命令信息
- ✅ **动态汉化** - 为未来可能的运行时汉化预留了接口

## 使用方法

### 自动化安装
```bash
./localize.sh --install
```

### 交互式安装
```bash
./localize.sh
```

### 仅创建备份
```bash
./localize.sh --backup
```

### 恢复原始状态
```bash
./localize.sh --restore
```

## 文件结构

```
/root/SuperClaude-Chinese-Localization/
├── translations/claude-code/
│   ├── package.json           # 汉化版本
│   ├── README.md              # 汉化版本
│   ├── commands-map.json      # 命令映射表
│   └── claude_help.txt       # 帮助信息
├── backup/claude-code/         # 备份文件
└── localize.sh                # 扩展的汉化脚本
```

## 未来改进

1. **运行时汉化** - 研究通过环境变量或配置文件实现运行时汉化
2. **插件系统** - 开发专门的 Claude Code 汉化插件
3. **社区贡献** - 收集更多命令描述和翻译
4. **自动化更新** - 实现汉化内容的自动化更新

## 注意事项

- Claude Code 核心包更新后需要重新运行汉化脚本
- 某些内置命令描述由于加密限制无法直接汉化
- 建议在更新前备份重要数据
- 汉化完成后需要重启 Claude Code 生效

---
*SuperClaude Chinese Localization Team*