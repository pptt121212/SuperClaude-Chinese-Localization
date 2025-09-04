#!/bin/bash

# SuperClaude 快速汉化脚本
# 版本: 1.0.0
# 作者: SuperClaude-Chinese-Localization Team
# 基于: SuperClaude Framework (https://github.com/SuperClaude-Org/SuperClaude_Framework)
# 
# 使用方法: curl -sSL https://raw.githubusercontent.com/pptt121212/SuperClaude-Chinese-Localization/main/install.sh | bash

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 配置变量
REPO_URL="https://github.com/pptt121212/SuperClaude-Chinese-Localization.git"
REPO_BRANCH="main"
INSTALL_DIR="$HOME/SuperClaude-Chinese-Localization"
CLAUDE_DIR="$HOME/.claude"

# 日志函数
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 检查系统依赖
check_dependencies() {
    log_info "检查系统依赖..."
    
    # 检查git
    if ! command -v git &> /dev/null; then
        log_error "未找到 git 命令，请先安装 git"
        log_error "Ubuntu/Debian: sudo apt-get install git"
        log_error "CentOS/RHEL: sudo yum install git"
        log_error "macOS: brew install git"
        exit 1
    fi
    
    # 检查curl
    if ! command -v curl &> /dev/null; then
        log_error "未找到 curl 命令，请先安装 curl"
        log_error "Ubuntu/Debian: sudo apt-get install curl"
        log_error "CentOS/RHEL: sudo yum install curl"
        log_error "macOS: brew install curl"
        exit 1
    fi
    
    # 检查bash
    if ! command -v bash &> /dev/null; then
        log_error "未找到 bash 命令，请先安装 bash"
        exit 1
    fi
    
    log_success "系统依赖检查通过"
}

# 检查SuperClaude安装
check_superclaude() {
    log_info "检查SuperClaude安装..."
    
    if [[ ! -d "${CLAUDE_DIR}" ]]; then
        log_error "未找到SuperClaude安装目录: ${CLAUDE_DIR}"
        log_error "请先安装原版SuperClaude插件"
        log_error "原版项目地址: https://github.com/SuperClaude-Org/SuperClaude_Framework"
        log_error "安装完成后重新运行此脚本"
        exit 1
    fi
    
    # 检查SuperClaude的标识文件
    local metadata_file="${CLAUDE_DIR}/.superclaude-metadata.json"
    local claude_config_file="${CLAUDE_DIR}/CLAUDE.md"
    
    if [[ ! -f "$metadata_file" ]]; then
        log_error "未找到SuperClaude的元数据文件: $metadata_file"
        log_error "这可能表明您未安装原版SuperClaude或安装不完整"
        log_error "请先安装原版SuperClaude: https://github.com/SuperClaude-Org/SuperClaude_Framework"
        exit 1
    fi
    
    # 验证元数据文件内容
    if ! grep -q "SuperClaude" "$metadata_file" 2>/dev/null; then
        log_error "元数据文件格式不正确，请确保安装了原版SuperClaude"
        exit 1
    fi
    
    # 检查关键配置文件（至少需要一个）
    local config_found=false
    for config_file in "$claude_config_file" "${CLAUDE_DIR}/FLAGS.md" "${CLAUDE_DIR}/PRINCIPLES.md"; do
        if [[ -f "$config_file" ]]; then
            config_found=true
            break
        fi
    done
    
    if [[ "$config_found" = false ]]; then
        log_warning "未找到SuperClaude配置文件，可能安装不完整"
        log_info "建议重新安装原版SuperClaude"
    fi
    
    # 提取版本信息
    local version=$(grep -o '"version": *"[^"]*"' "$metadata_file" | head -1 | cut -d'"' -f4)
    if [[ -n "$version" ]]; then
        log_success "检测到SuperClaude版本: $version"
    fi
    
    log_success "SuperClaude安装验证通过"
}

# 备份现有配置
backup_existing_config() {
    if [[ -d "${INSTALL_DIR}" ]]; then
        log_info "备份现有配置..."
        local backup_dir="${INSTALL_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
        cp -r "${INSTALL_DIR}" "${backup_dir}"
        log_success "现有配置已备份到: ${backup_dir}"
    fi
}

# 克隆或更新仓库
clone_repository() {
    log_info "获取汉化文件..."
    
    if [[ -d "${INSTALL_DIR}" ]]; then
        log_info "更新现有安装..."
        cd "${INSTALL_DIR}"
        git pull origin "${REPO_BRANCH}"
    else
        log_info "克隆仓库..."
        git clone -b "${REPO_BRANCH}" "${REPO_URL}" "${INSTALL_DIR}"
        cd "${INSTALL_DIR}"
    fi
    
    log_success "仓库获取完成"
}

# 设置执行权限
set_permissions() {
    log_info "设置执行权限..."
    
    # 给主脚本添加执行权限
    chmod +x "${INSTALL_DIR}/localize.sh"
    
    # 给install.sh添加执行权限
    chmod +x "${INSTALL_DIR}/install.sh"
    
    log_success "权限设置完成"
}

# 创建符号链接到系统路径
create_symlink() {
    log_info "创建命令符号链接..."
    
    # 创建本地bin目录
    mkdir -p "$HOME/.local/bin"
    
    # 创建符号链接
    ln -sf "${INSTALL_DIR}/localize.sh" "$HOME/.local/bin/superclaude-localize"
    ln -sf "${INSTALL_DIR}/install.sh" "$HOME/.local/bin/superclaude-install"
    
    # 检查是否在PATH中
    if [[ ! ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
        log_warning "$HOME/.local/bin 不在PATH中"
        log_info "请将以下行添加到您的 ~/.bashrc 或 ~/.zshrc:"
        echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
    fi
    
    log_success "符号链接创建完成"
}

# 显示安装信息
show_install_info() {
    echo
    echo "=== SuperClaude 汉化工具安装完成 ==="
    echo
    echo "安装目录: ${INSTALL_DIR}"
    echo "命令别名:"
    echo "  superclaude-localize - 启动汉化工具"
    echo "  superclaude-install   - 重新安装脚本"
    echo
    echo "快速使用方法:"
    echo "  superclaude-localize    # 启动交互式界面"
    echo "  superclaude-localize -i # 直接安装汉化"
    echo "  superclaude-localize -r # 恢复原始状态"
    echo "  superclaude-localize -c # 检查系统状态"
    echo
    echo "或者直接运行:"
    echo "  ${INSTALL_DIR}/localize.sh"
    echo
    echo "注意事项:"
    echo "1. 请确保已正确安装原版SuperClaude"
    echo "2. 汉化前会自动创建备份"
    echo "3. 如需恢复，运行恢复命令即可"
    echo
    echo "原版SuperClaude安装方法:"
    echo "  pipx install SuperClaude && SuperClaude install"
    echo "  或访问: https://github.com/SuperClaude-Org/SuperClaude_Framework"
    echo
    echo -e "${GREEN}🎉 安装完成！${NC}"
}

# 主安装流程
main() {
    echo "SuperClaude 汉化工具 - 快速安装脚本"
    echo "========================================"
    echo
    
    # 检查依赖
    check_dependencies
    
    # 检查SuperClaude
    check_superclaude
    
    # 备份现有配置
    backup_existing_config
    
    # 克隆仓库
    clone_repository
    
    # 设置权限
    set_permissions
    
    # 创建符号链接
    create_symlink
    
    # 显示安装信息
    show_install_info
    
    # 询问是否立即运行（仅在终端模式下）
    prompt_for_launch
}

# 询问是否立即运行（智能检测执行环境）
prompt_for_launch() {
    # 检查是否在终端中运行（有交互能力）
    if [[ -t 0 ]]; then
        echo
        read -p "是否立即运行汉化工具? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            "${INSTALL_DIR}/localize.sh"
        else
            show_next_steps
        fi
    else
        # 管道运行模式，显示后续步骤
        show_next_steps
    fi
}

# 显示后续步骤
show_next_steps() {
    echo
    echo "🚀 现在可以开始使用汉化工具了："
    echo
    echo "推荐方式："
    echo "  superclaude-localize          # 启动交互式界面"
    echo
    echo "快速操作："
    echo "  superclaude-localize -i       # 直接安装汉化"
    echo "  superclaude-localize -r       # 恢复原始状态"
    echo "  superclaude-localize -c       # 检查系统状态"
    echo
    echo "或者直接运行："
    echo "  ${INSTALL_DIR}/localize.sh"
    echo
    echo -e "${BLUE}💡 提示: 如果遇到问题，请运行 superclaude-localize -h 查看帮助${NC}"
}

# 运行主函数
main "$@"