#!/bin/bash

# SuperClaude 无侵入式汉化脚本 - 优化版
# 版本: 1.0.0
# 作者: SuperClaude-Chinese-Localization Team

set -e

# 颜色定义（简化版）
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 路径配置
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SUPERCLAUDE_DIR="/root/.claude"
BACKUP_DIR="${SCRIPT_DIR}/backup"
TRANSLATIONS_DIR="${SCRIPT_DIR}/translations"

# Claude Code 核心包路径
CLAUDE_CODE_DIR="/root/.nvm/versions/node/v22.19.0/lib/node_modules/@anthropic-ai/claude-code"
CLAUDE_CODE_BACKUP_DIR="${BACKUP_DIR}/claude-code"
CLAUDE_CODE_TRANSLATIONS_DIR="${TRANSLATIONS_DIR}/claude-code"

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

# 检查SuperClaude安装
check_superclaude() {
    if [[ ! -d "${SUPERCLAUDE_DIR}" ]]; then
        log_error "未找到SuperClaude安装目录: ${SUPERCLAUDE_DIR}"
        exit 1
    fi
    
    if [[ ! -f "${SUPERCLAUDE_DIR}/.superclaude-metadata.json" ]]; then
        log_error "未找到SuperClaude元数据文件，请确保SuperClaude已正确安装"
        exit 1
    fi
    
    log_success "SuperClaude安装验证通过"
}

# 获取SuperClaude版本
get_superclaude_version() {
    if [[ -f "${SUPERCLAUDE_DIR}/.superclaude-metadata.json" ]]; then
        grep -o '"version": "[^"]*"' "${SUPERCLAUDE_DIR}/.superclaude-metadata.json" | head -1 | cut -d'"' -f4
    else
        echo "unknown"
    fi
}

# 创建备份
create_backup() {
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local backup_path="${BACKUP_DIR}/backup_${timestamp}"
    
    log_info "创建备份到: ${backup_path}"
    
    mkdir -p "${backup_path}"
    
    # 按原始目录结构备份
    # 备份命令文件
    if [[ -d "${SUPERCLAUDE_DIR}/commands" ]]; then
        mkdir -p "${backup_path}/commands"
        cp -r "${SUPERCLAUDE_DIR}/commands" "${backup_path}/"
    fi
    
    # 备份代理文件
    if [[ -d "${SUPERCLAUDE_DIR}/agents" ]]; then
        mkdir -p "${backup_path}/agents"
        cp -r "${SUPERCLAUDE_DIR}/agents" "${backup_path}/"
    fi
    
    # 备份模式文件
    for mode_file in "${SUPERCLAUDE_DIR}"/MODE_*.md; do
        if [[ -f "${mode_file}" ]]; then
            cp "${mode_file}" "${backup_path}/"
        fi
    done
    
    # 备份MCP文件
    for mcp_file in "${SUPERCLAUDE_DIR}"/MCP_*.md; do
        if [[ -f "${mcp_file}" ]]; then
            cp "${mcp_file}" "${backup_path}/"
        fi
    done
    
    # 备份核心文件
    for core_file in "FLAGS.md" "PRINCIPLES.md" "RULES.md" "CLAUDE.md"; do
        if [[ -f "${SUPERCLAUDE_DIR}/${core_file}" ]]; then
            cp "${SUPERCLAUDE_DIR}/${core_file}" "${backup_path}/"
        fi
    done
    
    # 备份元数据
    if [[ -f "${SUPERCLAUDE_DIR}/.superclaude-metadata.json" ]]; then
        cp "${SUPERCLAUDE_DIR}/.superclaude-metadata.json" "${backup_path}/"
    fi
    
    # 备份 Claude Code 核心包文件
    if [[ -d "${CLAUDE_CODE_DIR}" ]]; then
        log_info "备份 Claude Code 核心包文件..."
        mkdir -p "${backup_path}/claude-code"
        
        # 备份 package.json
        if [[ -f "${CLAUDE_CODE_DIR}/package.json" ]]; then
            cp "${CLAUDE_CODE_DIR}/package.json" "${backup_path}/claude-code/"
        fi
        
        # 备份 README.md
        if [[ -f "${CLAUDE_CODE_DIR}/README.md" ]]; then
            cp "${CLAUDE_CODE_DIR}/README.md" "${backup_path}/claude-code/"
        fi
        
        # 备份 LICENSE.md
        if [[ -f "${CLAUDE_CODE_DIR}/LICENSE.md" ]]; then
            cp "${CLAUDE_CODE_DIR}/LICENSE.md" "${backup_path}/claude-code/"
        fi
        
        log_success "Claude Code 核心包备份完成"
    fi
    
    # 创建备份清单
    cd "${backup_path}"
    find . -type f -exec md5sum {} \; > "${backup_path}/backup_checksums.txt" 2>/dev/null || true
    cd "${SCRIPT_DIR}"
    
    log_success "备份创建完成: ${backup_path}"
    echo "${backup_path}" > "${BACKUP_DIR}/latest_backup.txt"
}

# 从备份恢复
restore_from_backup() {
    local backup_path="$1"
    
    if [[ -z "${backup_path}" ]]; then
        if [[ -f "${BACKUP_DIR}/latest_backup.txt" ]]; then
            backup_path=$(cat "${BACKUP_DIR}/latest_backup.txt")
        else
            log_error "未找到可用的备份"
            exit 1
        fi
    fi
    
    if [[ ! -d "${backup_path}" ]]; then
        log_error "备份目录不存在: ${backup_path}"
        exit 1
    fi
    
    log_info "从备份恢复: ${backup_path}"
    
    # 恢复命令文件
    if [[ -d "${backup_path}/commands" ]]; then
        cp -r "${backup_path}/commands" "${SUPERCLAUDE_DIR}/"
    fi
    
    # 恢复代理文件
    if [[ -d "${backup_path}/agents" ]]; then
        cp -r "${backup_path}/agents" "${SUPERCLAUDE_DIR}/"
    fi
    
    # 恢复模式文件
    for mode_file in "${backup_path}"/MODE_*.md; do
        if [[ -f "${mode_file}" ]]; then
            cp "${mode_file}" "${SUPERCLAUDE_DIR}/"
        fi
    done
    
    # 恢复MCP文件
    for mcp_file in "${backup_path}"/MCP_*.md; do
        if [[ -f "${mcp_file}" ]]; then
            cp "${mcp_file}" "${SUPERCLAUDE_DIR}/"
        fi
    done
    
    # 恢复核心文件
    for core_file in "FLAGS.md" "PRINCIPLES.md" "RULES.md" "CLAUDE.md"; do
        if [[ -f "${backup_path}/${core_file}" ]]; then
            cp "${backup_path}/${core_file}" "${SUPERCLAUDE_DIR}/"
        fi
    done
    
    # 恢复元数据
    if [[ -f "${backup_path}/.superclaude-metadata.json" ]]; then
        cp "${backup_path}/.superclaude-metadata.json" "${SUPERCLAUDE_DIR}/"
    fi
    
    # 恢复 Claude Code 核心包文件
    if [[ -d "${backup_path}/claude-code" ]]; then
        log_info "恢复 Claude Code 核心包文件..."
        
        # 恢复 package.json
        if [[ -f "${backup_path}/claude-code/package.json" ]]; then
            cp "${backup_path}/claude-code/package.json" "${CLAUDE_CODE_DIR}/"
        fi
        
        # 恢复 README.md
        if [[ -f "${backup_path}/claude-code/README.md" ]]; then
            cp "${backup_path}/claude-code/README.md" "${CLAUDE_CODE_DIR}/"
        fi
        
        # 恢复 LICENSE.md
        if [[ -f "${backup_path}/claude-code/LICENSE.md" ]]; then
            cp "${backup_path}/claude-code/LICENSE.md" "${CLAUDE_CODE_DIR}/"
        fi
        
        log_success "Claude Code 核心包恢复完成"
    fi
    
    log_success "从备份恢复完成"
    
    # 清理备份文件
    log_info "清理备份文件..."
    rm -rf "${backup_path}"
    
    # 清理备份记录文件
    if [[ -f "${BACKUP_DIR}/latest_backup.txt" ]]; then
        local latest_backup=$(cat "${BACKUP_DIR}/latest_backup.txt")
        if [[ "${latest_backup}" == "${backup_path}" ]]; then
            rm -f "${BACKUP_DIR}/latest_backup.txt"
        fi
    fi
    
    log_success "备份文件清理完成"
}

# 汉化命令文件 (支持完整替换和无侵入式两种模式)
localize_commands() {
    log_info "开始汉化命令文件..."
    
    local commands_dir="${SUPERCLAUDE_DIR}/commands/sc"
    local translations_dir="${TRANSLATIONS_DIR}/commands/sc"
    
    for cmd_file in "${commands_dir}"/*.md; do
        if [[ -f "${cmd_file}" ]]; then
            local cmd_name=$(basename "${cmd_file}" .md)
            
            # 首先尝试完整翻译文件
            local full_translation_file="${translations_dir}/${cmd_name}.md"
            local desc_translation_file="${translations_dir}/${cmd_name}_desc.txt"
            
            if [[ -f "${full_translation_file}" ]]; then
                log_info "汉化命令 (完整替换): ${cmd_name}"
                
                # 完整替换为汉化版本
                cp "${full_translation_file}" "${cmd_file}"
                
                log_success "命令 ${cmd_name} 完整汉化完成"
            elif [[ -f "${desc_translation_file}" ]]; then
                log_info "汉化命令 (无侵入式): ${cmd_name}"
                
                # 汉化description字段
                local chinese_desc=$(cat "${desc_translation_file}")
                sed -i "s/^description: \".*\"/description: \"${chinese_desc}\"/" "${cmd_file}"
                
                # 汉化文档标题
                sed -i "s/^# \/sc:[a-z-]* - .*$/# \/sc:${cmd_name} - ${chinese_desc}/" "${cmd_file}"
                
                log_success "命令 ${cmd_name} 描述汉化完成"
            fi
        fi
    done
}

# 汉化代理文件 (直接替换)
localize_agents() {
    log_info "开始汉化代理文件..."
    
    local agents_dir="${SUPERCLAUDE_DIR}/agents"
    local translations_dir="${TRANSLATIONS_DIR}/agents"
    
    for agent_file in "${agents_dir}"/*.md; do
        if [[ -f "${agent_file}" ]]; then
            local agent_name=$(basename "${agent_file}" .md)
            local translation_file="${translations_dir}/${agent_name}.md"
            
            if [[ -f "${translation_file}" ]]; then
                log_info "汉化代理: ${agent_name}"
                
                # 直接替换为汉化版本
                cp "${translation_file}" "${agent_file}"
                
                log_success "代理 ${agent_name} 汉化完成"
            fi
        fi
    done
}

# 汉化模式文件 (直接替换)
localize_modes() {
    log_info "开始汉化模式文件..."
    
    local translations_dir="${TRANSLATIONS_DIR}/modes"
    
    for mode_file in "${SUPERCLAUDE_DIR}"/MODE_*.md; do
        if [[ -f "${mode_file}" ]]; then
            local mode_name=$(basename "${mode_file}" .md)
            local translation_file="${translations_dir}/${mode_name}.md"
            
            if [[ -f "${translation_file}" ]]; then
                log_info "汉化模式: ${mode_name}"
                
                # 直接替换为汉化版本
                cp "${translation_file}" "${mode_file}"
                
                log_success "模式 ${mode_name} 汉化完成"
            fi
        fi
    done
}

# 汉化MCP文件 (直接替换)
localize_mcp() {
    log_info "开始汉化MCP文档..."
    
    local translations_dir="${TRANSLATIONS_DIR}/mcp"
    
    for mcp_file in "${SUPERCLAUDE_DIR}"/MCP_*.md; do
        if [[ -f "${mcp_file}" ]]; then
            local mcp_name=$(basename "${mcp_file}" .md)
            local translation_file="${translations_dir}/${mcp_name}.md"
            
            if [[ -f "${translation_file}" ]]; then
                log_info "汉化MCP: ${mcp_name}"
                
                # 直接替换为汉化版本
                cp "${translation_file}" "${mcp_file}"
                
                log_success "MCP ${mcp_name} 汉化完成"
            fi
        fi
    done
}

# 汉化核心文件 (直接替换)
localize_core() {
    log_info "开始汉化核心文件..."
    
    local translations_dir="${TRANSLATIONS_DIR}/core"
    local core_files=("FLAGS.md" "PRINCIPLES.md" "RULES.md" "CLAUDE.md")
    
    for core_file in "${core_files[@]}"; do
        local translation_file="${translations_dir}/${core_file}"
        
        if [[ -f "${translation_file}" && -f "${SUPERCLAUDE_DIR}/${core_file}" ]]; then
            log_info "汉化核心文件: ${core_file}"
            
            # 直接替换为汉化版本
            cp "${translation_file}" "${SUPERCLAUDE_DIR}/${core_file}"
            
            log_success "核心文件 ${core_file} 汉化完成"
        fi
    done
}

# 汉化 Claude Code 核心包
localize_claude_code() {
    log_info "开始汉化 Claude Code 核心包..."
    
    # 检查 Claude Code 是否安装
    if [[ ! -d "${CLAUDE_CODE_DIR}" ]]; then
        log_warning "未找到 Claude Code 核心包: ${CLAUDE_CODE_DIR}"
        return 1
    fi
    
    # 汉化 package.json
    if [[ -f "${CLAUDE_CODE_TRANSLATIONS_DIR}/package.json" && -f "${CLAUDE_CODE_DIR}/package.json" ]]; then
        log_info "汉化 package.json"
        cp "${CLAUDE_CODE_TRANSLATIONS_DIR}/package.json" "${CLAUDE_CODE_DIR}/package.json"
        log_success "package.json 汉化完成"
    fi
    
    # 汉化 README.md
    if [[ -f "${CLAUDE_CODE_TRANSLATIONS_DIR}/README.md" && -f "${CLAUDE_CODE_DIR}/README.md" ]]; then
        log_info "汉化 README.md"
        cp "${CLAUDE_CODE_TRANSLATIONS_DIR}/README.md" "${CLAUDE_CODE_DIR}/README.md"
        log_success "README.md 汉化完成"
    fi
    
    # 汉化 LICENSE.md (如果存在)
    if [[ -f "${CLAUDE_CODE_TRANSLATIONS_DIR}/LICENSE.md" && -f "${CLAUDE_CODE_DIR}/LICENSE.md" ]]; then
        log_info "汉化 LICENSE.md"
        cp "${CLAUDE_CODE_TRANSLATIONS_DIR}/LICENSE.md" "${CLAUDE_CODE_DIR}/LICENSE.md"
        log_success "LICENSE.md 汉化完成"
    fi
    
    log_success "Claude Code 核心包汉化完成"
}

# 显示帮助信息
show_help() {
    cat << EOF
SuperClaude 无侵入式汉化脚本

用法: $0 [选项]

选项:
    -h, --help          显示帮助信息
    -i, --install       直接安装汉化（非交互式）
    -r, --restore       恢复原始状态（非交互式）
    -b, --backup        仅创建备份
    -v, --version       显示版本信息
    -c, --check         检查系统状态
    --interactive      启动交互式界面（默认）

特性:
    - SuperClaude 插件汉化
    - Claude Code 核心包汉化
    - 内置命令描述汉化
    - 完整的备份和恢复功能

示例:
    $0                  # 启动交互式界面（推荐）
    $0 --install        # 直接安装汉化
    $0 --restore        # 直接恢复原始状态
    $0 --backup         # 仅创建备份
    $0 --check          # 检查系统状态

交互式模式特性:
    - 彩色用户界面
    - 实时状态检测
    - 进度显示
    - 操作确认
    - 错误处理

EOF
}

# 显示版本信息
show_version() {
    local version=$(get_superclaude_version)
    echo "SuperClaude 汉化脚本 v1.0.0"
    echo "SuperClaude 版本: ${version}"
}

# 检查系统状态
check_status() {
    log_info "检查系统状态..."
    
    local version=$(get_superclaude_version)
    echo "SuperClaude 版本: ${version}"
    
    # 检查是否有备份
    if [[ -f "${BACKUP_DIR}/latest_backup.txt" ]]; then
        local backup_path=$(cat "${BACKUP_DIR}/latest_backup.txt")
        echo "最新备份: ${backup_path}"
    else
        echo "未找到备份"
    fi
    
    # 检查汉化状态
    if [[ -f "${BACKUP_DIR}/latest_backup.txt" ]]; then
        echo "已汉化: 是 (有备份存在)"
    else
        echo "已汉化: 否"
    fi
}

# 显示系统状态
show_system_status() {
    echo "=== SuperClaude 汉化工具 - 系统状态 ==="
    echo
    
    # 检查SuperClaude安装
    if [[ -d "${SUPERCLAUDE_DIR}" ]]; then
        echo "[✓] SuperClaude 已安装在: ${SUPERCLAUDE_DIR}"
        local version=$(get_superclaude_version)
        echo "[✓] SuperClaude 版本: ${version}"
    else
        echo "[✗] 未检测到 SuperClaude 安装"
        echo "[✗] 无法获取版本信息"
    fi
    
    echo
    
    # 检查备份状态
    if [[ -f "${BACKUP_DIR}/latest_backup.txt" ]]; then
        local backup_path=$(cat "${BACKUP_DIR}/latest_backup.txt")
        echo "[✓] 备份目录: ${backup_path}"
    else
        echo "[○] 无可用备份"
    fi
    
    echo
    
    # 检查汉化状态
    if [[ -f "${BACKUP_DIR}/latest_backup.txt" ]]; then
        echo "[✓] 已汉化: 是 (有备份存在)"
    else
        echo "[○] 当前未汉化"
    fi
    
    echo
}

# 显示汉化预览
show_localization_preview() {
    echo "=== 汉化预览 ==="
    echo
    
    # 显示将要汉化的文件类型
    echo "将汉化的文件类型:"
    
    # 命令文件
    if [[ -d "${SUPERCLAUDE_DIR}/commands/sc" ]]; then
        local cmd_count=$(find "${SUPERCLAUDE_DIR}/commands/sc" -name "*.md" | wc -l)
        echo "- 命令文件: ${cmd_count} 个"
    fi
    
    # 代理文件
    if [[ -d "${SUPERCLAUDE_DIR}/agents" ]]; then
        local agent_count=$(find "${SUPERCLAUDE_DIR}/agents" -name "*.md" | wc -l)
        echo "- 代理文件: ${agent_count} 个"
    fi
    
    # 模式文件
    local mode_count=$(find "${SUPERCLAUDE_DIR}" -name "MODE_*.md" | wc -l)
    echo "- 模式文件: ${mode_count} 个"
    
    # MCP文件
    local mcp_count=$(find "${SUPERCLAUDE_DIR}" -name "MCP_*.md" | wc -l)
    echo "- MCP文件: ${mcp_count} 个"
    
    # 核心文件
    echo "- 核心文件: FLAGS.md, PRINCIPLES.md, RULES.md, CLAUDE.md"
    
    echo
    
    # 显示翻译文件示例
    if [[ -d "${TRANSLATIONS_DIR}" ]]; then
        echo "翻译文件示例:"
        find "${TRANSLATIONS_DIR}" -name "*.md" -o -name "*.txt" | head -5 | while read file; do
            echo "  - ${file##*/}"
        done
        echo
    fi
}

# 显示主菜单
show_main_menu() {
    echo "=== SuperClaude 汉化工具 v1.0.0 ==="
    echo
    echo "请选择操作:"
    echo "1. 查看系统状态"
    echo "2. 查看汉化预览"
    echo "3. 开始汉化"
    echo "4. 取消汉化"
    echo "5. 退出"
    echo
    echo -n "请输入选项 [1-5]: "
}

# 简单的进度显示
show_progress() {
    local current=$1
    local total=$2
    local percentage=$((current * 100 / total))
    echo "进度: $percentage% ($current/$total)"
}

# 执行汉化
execute_localization() {
    clear
    echo "=== 开始汉化 SuperClaude ==="
    echo
    
    # 检查SuperClaude安装
    if [[ ! -d "${SUPERCLAUDE_DIR}" ]]; then
        log_error "未找到SuperClaude安装目录"
        return 1
    fi
    
    # 确认操作
    echo "即将开始汉化操作，这将："
    echo "1. 创建原始文件备份"
    echo "2. 汉化所有支持的文件类型"
    echo "3. 保留备份以便恢复"
    echo
    read -p "确认继续? (y/N): " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "操作已取消"
        return 0
    fi
    
    # 创建备份
    echo "创建备份..."
    create_backup
    echo -e "${GREEN}✓${NC} 备份创建完成"
    echo
    
    # 汉化命令文件
    echo "汉化命令文件..."
    localize_commands
    echo -e "${GREEN}✓${NC} 命令文件汉化完成"
    echo
    
    # 汉化其他文件
    echo "汉化代理文件..."
    localize_agents
    echo -e "${GREEN}✓${NC} 代理文件汉化完成"
    echo
    
    echo "汉化模式文件..."
    localize_modes
    echo -e "${GREEN}✓${NC} 模式文件汉化完成"
    echo
    
    echo "汉化MCP文档..."
    localize_mcp
    echo -e "${GREEN}✓${NC} MCP文档汉化完成"
    echo
    
    echo "汉化核心文件..."
    localize_core
    echo -e "${GREEN}✓${NC} 核心文件汉化完成"
    echo
    
    echo "汉化 Claude Code 核心包..."
    localize_claude_code
    echo -e "${GREEN}✓${NC} Claude Code 核心包汉化完成"
    echo
    
    echo -e "${GREEN}🎉 SuperClaude 汉化完成！${NC}"
    echo -e "${YELLOW}请重启 Claude Code 以使汉化生效${NC}"
    echo
    read -p "按 Enter 键返回主菜单..."
}

# 执行恢复
execute_restore() {
    clear
    echo "=== 恢复 SuperClaude 原始状态 ==="
    echo
    
    # 检查是否有备份
    if [[ ! -f "${BACKUP_DIR}/latest_backup.txt" ]]; then
        log_error "未找到可用的备份"
        return 1
    fi
    
    local backup_path=$(cat "${BACKUP_DIR}/latest_backup.txt")
    
    if [[ ! -d "${backup_path}" ]]; then
        log_error "备份目录不存在: ${backup_path}"
        return 1
    fi
    
    echo "从备份恢复: ${backup_path}"
    echo
    
    # 确认恢复
    echo -e "${RED}警告: 此操作将恢复所有文件到原始状态${NC}"
    echo "所有汉化将被移除"
    read -p "确认继续? (y/N): " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "操作已取消"
        return 0
    fi
    
    # 执行恢复
    restore_from_backup
    
    echo -e "${GREEN}✓${NC} 恢复完成"
    echo -e "${YELLOW}请重启 Claude Code 以使恢复生效${NC}"
    echo
    read -p "按 Enter 键返回主菜单..."
}

# 简化的主循环
main_loop() {
    while true; do
        clear
        show_main_menu
        
        read -r choice
        
        case "$choice" in
            1)
                clear
                show_system_status
                echo
                read -p "按 Enter 键继续..."
                ;;
            2)
                clear
                show_localization_preview
                echo
                read -p "按 Enter 键继续..."
                ;;
            3)
                # 检查SuperClaude安装
                if [[ ! -d "${SUPERCLAUDE_DIR}" ]]; then
                    clear
                    echo -e "${RED}错误: 未找到SuperClaude安装目录${NC}"
                    echo -e "${YELLOW}请确保SuperClaude已正确安装在 ${SUPERCLAUDE_DIR}${NC}"
                    echo
                    read -p "按 Enter 键继续..."
                    continue
                fi
                
                # 检查汉化状态
                if [[ -f "${BACKUP_DIR}/latest_backup.txt" ]]; then
                    clear
                    echo -e "${YELLOW}警告: 检测到已汉化的文件${NC}"
                    echo -e "${YELLOW}重新汉化将覆盖现有汉化，但不会影响原始文件${NC}"
                    echo
                    read -p "继续汉化? (y/N): " confirm
                    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
                        continue
                    fi
                fi
                
                execute_localization
                ;;
            4)
                # 检查汉化状态
                if [[ ! -f "${BACKUP_DIR}/latest_backup.txt" ]]; then
                    clear
                    echo -e "${YELLOW}提示: 当前未检测到汉化文件${NC}"
                    echo
                    read -p "按 Enter 键继续..."
                    continue
                fi
                
                execute_restore
                ;;
            5)
                clear
                echo
                echo "感谢使用 SuperClaude 汉化工具！"
                exit 0
                ;;
            *)
                clear
                echo
                echo -e "${RED}无效选项: $choice${NC}"
                echo -e "${YELLOW}请输入 1-5 之间的数字${NC}"
                echo
                read -p "按 Enter 键继续..."
                ;;
        esac
    done
}

# 主函数
main() {
    case "${1:-}" in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--version)
            show_version
            exit 0
            ;;
        -c|--check)
            check_superclaude
            check_status
            exit 0
            ;;
        -b|--backup)
            check_superclaude
            create_backup
            log_success "备份创建完成"
            exit 0
            ;;
        -r|--restore)
            check_superclaude
            restore_from_backup
            log_success "恢复完成"
            exit 0
            ;;
        -i|--install)
            check_superclaude
            create_backup
            localize_commands
            localize_agents
            localize_modes
            localize_mcp
            localize_core
            localize_claude_code
            log_success "SuperClaude 汉化完成！"
            log_info "请重启 Claude Code 以使汉化生效"
            exit 0
            ;;
        ""|--interactive)
            # 交互式模式（默认）
            main_loop
            ;;
        *)
            log_error "未知选项: $1"
            show_help
            exit 1
            ;;
    esac
}

# 运行主函数
main "$@"