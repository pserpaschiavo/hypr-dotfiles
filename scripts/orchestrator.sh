#!/bin/bash

# ============================================================================
#  🚀 HYPRLAND ULTIMATE SETUP ORCHESTRATOR 🚀
# ============================================================================
# Este script orquestra TODA a instalação e configuração do ambiente Hyprland
# 
# Executa em ordem:
# 1. Dependências do sistema
# 2. Cursores Nordzy
# 3. Aplicações CLI
# 4. Wallust (temas dinâmicos)
# 5. Symlinks de configurações
# 6. SDDM (display manager)
# 7. Auto-login (opcional)
# 8. Configuração de boot do Hyprland
# 9. Validação final
#
# Autor: Phil's Dotfiles
# ============================================================================

set -e  # Exit on error

# ============================================================================
# CORES E FUNÇÕES DE LOG
# ============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Banner ASCII
show_banner() {
    clear
    echo -e "${MAGENTA}"
    cat << "EOF"
╦ ╦┬ ┬┌─┐┬─┐┬  ┌─┐┌┐┌┌┬┐  ╦ ╦┬ ┌┬┐┬┌┬┐┌─┐┌┬┐┌─┐
╠═╣└┬┘├─┘├┬┘│  ├─┤│││ ││  ║ ║│  │ │││││├─┤ │ ├┤ 
╩ ╩ ┴ ┴  ┴└─┴─┘┴ ┴┘└┘─┴┘  ╚═╝┴─┘┴ ┴┴ ┴┴┴ ┴ ┴ └─┘
╔═════════════════════════════════════════════════╗
║     SETUP COMPLETO E AUTOMÁTICO                 ║
║     Instala e configura TUDO!                   ║
╚═════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    echo ""
}

log_header() {
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC} ${WHITE}$1${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

log_step() {
    echo -e "${CYAN}[●]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

log_error() {
    echo -e "${RED}[✗]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

log_info() {
    echo -e "${BLUE}[i]${NC} $1"
}

# Confirmação do usuário
ask_confirmation() {
    local question="$1"
    local default="${2:-n}"
    
    if [ "$default" = "y" ]; then
        echo -ne "${YELLOW}$question [Y/n]:${NC} "
    else
        echo -ne "${YELLOW}$question [y/N]:${NC} "
    fi
    
    read -r response
    
    if [ -z "$response" ]; then
        response="$default"
    fi
    
    case "$response" in
        [yY][eE][sS]|[yY]) 
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# ============================================================================
# VERIFICAÇÕES INICIAIS
# ============================================================================

check_prerequisites() {
    log_header "🔍 VERIFICAÇÕES INICIAIS"
    
    # Verificar se está no diretório correto
    if [ ! -f "$(pwd)/scripts/orchestrator.sh" ]; then
        log_error "Execute este script de dentro do diretório Dotfiles!"
        log_info "cd ~/Dotfiles && ./scripts/orchestrator.sh"
        exit 1
    fi
    
    log_success "Diretório correto"
    
    # Verificar Arch Linux
    if [ ! -f /etc/arch-release ]; then
        log_warning "Este script foi feito para Arch Linux"
        if ! ask_confirmation "Continuar mesmo assim?"; then
            exit 0
        fi
    else
        log_success "Sistema: Arch Linux"
    fi
    
    # Verificar yay
    if ! command -v yay &> /dev/null; then
        log_error "yay não encontrado!"
        log_info "Instale yay primeiro: https://github.com/Jguer/yay"
        exit 1
    fi
    log_success "yay instalado"
    
    # Verificar git
    if ! command -v git &> /dev/null; then
        log_error "git não encontrado!"
        exit 1
    fi
    log_success "git instalado"
    
    echo ""
}

# ============================================================================
# BACKUP
# ============================================================================

backup_existing_configs() {
    log_header "📦 BACKUP DE CONFIGURAÇÕES EXISTENTES"
    
    BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d_%H%M%S)"
    
    local has_configs=false
    
    for dir in hypr waybar dunst rofi ghostty wallust; do
        if [ -d "$HOME/.config/$dir" ] && [ ! -L "$HOME/.config/$dir" ]; then
            if [ "$has_configs" = false ]; then
                mkdir -p "$BACKUP_DIR"
                has_configs=true
            fi
            log_step "Backup: ~/.config/$dir"
            cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
        fi
    done
    
    if [ "$has_configs" = true ]; then
        log_success "Backup salvo em: $BACKUP_DIR"
    else
        log_info "Nenhuma configuração anterior encontrada"
    fi
    
    echo ""
}

# ============================================================================
# INSTALAÇÃO - FASE 1: SISTEMA BASE
# ============================================================================

install_phase1_system() {
    log_header "📦 FASE 1: DEPENDÊNCIAS DO SISTEMA"
    
    if [ -f "scripts/install-phase1.sh" ]; then
        log_step "Executando install-phase1.sh..."
        bash scripts/install-phase1.sh
        log_success "Fase 1 completa"
    else
        log_error "Script install-phase1.sh não encontrado!"
        exit 1
    fi
    
    echo ""
}

# ============================================================================
# INSTALAÇÃO - FASE 2: CURSORES
# ============================================================================

install_phase2_cursors() {
    log_header "🖱️  FASE 2: CURSORES NORDZY"
    
    if [ -f "scripts/setup-cursors.sh" ]; then
        log_step "Executando setup-cursors.sh..."
        bash scripts/setup-cursors.sh
        log_success "Fase 2 completa"
    else
        log_warning "Script setup-cursors.sh não encontrado (opcional)"
    fi
    
    echo ""
}

# ============================================================================
# INSTALAÇÃO - FASE 3: APLICAÇÕES CLI
# ============================================================================

install_phase3_cli_apps() {
    log_header "🖥️  FASE 3: APLICAÇÕES CLI"
    
    if [ -f "scripts/install-cli-apps.sh" ]; then
        log_step "Executando install-cli-apps.sh..."
        bash scripts/install-cli-apps.sh
        log_success "Fase 3 completa"
    else
        log_warning "Script install-cli-apps.sh não encontrado (opcional)"
    fi
    
    echo ""
}

# ============================================================================
# INSTALAÇÃO - FASE 4: WALLUST
# ============================================================================

install_phase4_wallust() {
    log_header "🎨 FASE 4: WALLUST (TEMAS DINÂMICOS)"
    
    if [ -f "scripts/setup-wallust.sh" ]; then
        log_step "Executando setup-wallust.sh..."
        bash scripts/setup-wallust.sh
        log_success "Fase 4 completa"
    else
        log_warning "Script setup-wallust.sh não encontrado (opcional)"
    fi
    
    echo ""
}

# ============================================================================
# INSTALAÇÃO - FASE 5: SYMLINKS
# ============================================================================

create_symlinks() {
    log_header "🔗 FASE 5: CRIANDO SYMLINKS"
    
    DOTFILES_DIR="$(pwd)"
    
    # Array de configurações
    declare -A configs=(
        ["hypr"]="$DOTFILES_DIR/hypr/.config/hypr"
        ["waybar"]="$DOTFILES_DIR/waybar/.config/waybar"
        ["dunst"]="$DOTFILES_DIR/dunst/.config/dunst"
        ["rofi"]="$DOTFILES_DIR/rofi/.config/rofi"
        ["ghostty"]="$DOTFILES_DIR/ghostty/.config/ghostty"
        ["wallust"]="$DOTFILES_DIR/wallust/.config/wallust"
        ["hyprpaper"]="$DOTFILES_DIR/hyprpaper/.config/hyprpaper"
    )
    
    for name in "${!configs[@]}"; do
        source_dir="${configs[$name]}"
        target_dir="$HOME/.config/$name"
        
        if [ -d "$source_dir" ]; then
            # Remove existing (if not symlink)
            if [ -d "$target_dir" ] && [ ! -L "$target_dir" ]; then
                log_warning "Removendo diretório existente: $target_dir"
                rm -rf "$target_dir"
            elif [ -L "$target_dir" ]; then
                log_info "Symlink já existe: $name"
                rm "$target_dir"
            fi
            
            # Create symlink
            ln -sf "$source_dir" "$target_dir"
            log_success "Symlink criado: $name"
        else
            log_warning "Diretório não encontrado: $source_dir"
        fi
    done
    
    echo ""
}

# ============================================================================
# INSTALAÇÃO - FASE 6: SDDM
# ============================================================================

setup_sddm() {
    log_header "🖥️  FASE 6: DISPLAY MANAGER (SDDM)"
    
    if ask_confirmation "Instalar e configurar SDDM?"; then
        if [ -f "scripts/setup-sddm.sh" ]; then
            log_step "Executando setup-sddm.sh..."
            bash scripts/setup-sddm.sh
            log_success "SDDM configurado"
        else
            log_warning "Script setup-sddm.sh não encontrado"
        fi
    else
        log_info "SDDM ignorado"
    fi
    
    echo ""
}

# ============================================================================
# INSTALAÇÃO - FASE 7: SEGURANÇA (LOGIN COM SENHA)
# ============================================================================

setup_secure_login() {
    log_header "🔐 FASE 7: CONFIGURAÇÃO DE LOGIN SEGURO"
    
    log_success "Senha obrigatória habilitada (padrão)"
    log_info "SDDM sempre pedirá senha ao iniciar"
    
    # Garantir que não existe configuração de auto-login
    if [ -f /etc/sddm.conf.d/autologin.conf ]; then
        log_step "Removendo configuração de auto-login anterior..."
        sudo rm -f /etc/sddm.conf.d/autologin.conf
        log_success "Auto-login desabilitado"
    fi
    
    # Garantir que Hyprland seja a sessão padrão (mas não auto-login)
    if [ -f /etc/sddm.conf ]; then
        # Remover qualquer linha de auto-login se existir
        sudo sed -i '/\[Autologin\]/d' /etc/sddm.conf
        sudo sed -i '/^User=/d' /etc/sddm.conf
        sudo sed -i '/^Session=/d' /etc/sddm.conf
    fi
    
    log_success "Login seguro configurado"
    log_info "Ao reiniciar, SDDM pedirá usuário e senha"
    
    echo ""
}

# ============================================================================
# INSTALAÇÃO - FASE 8: HYPRLAND COMO PADRÃO
# ============================================================================

setup_hyprland_default() {
    log_header "🎯 FASE 8: HYPRLAND COMO SESSÃO PADRÃO"
    
    # Verificar se Hyprland está instalado
    if ! command -v Hyprland &> /dev/null; then
        log_error "Hyprland não está instalado!"
        log_info "Execute a Fase 1 primeiro"
        return 1
    fi
    
    log_success "Hyprland instalado"
    
    # Verificar session file
    if [ ! -f /usr/share/wayland-sessions/hyprland.desktop ]; then
        log_warning "Arquivo de sessão não encontrado, criando..."
        
        sudo tee /usr/share/wayland-sessions/hyprland.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Hyprland
Comment=An intelligent dynamic tiling Wayland compositor
Exec=Hyprland
Type=Application
EOF
        log_success "Arquivo de sessão criado"
    else
        log_success "Arquivo de sessão existe"
    fi
    
    # Verificar SDDM
    if systemctl is-enabled sddm &> /dev/null; then
        log_success "SDDM está habilitado"
        
        # Configurar sessão padrão no SDDM
        if [ -f /etc/sddm.conf ]; then
            if ! grep -q "Session=hyprland" /etc/sddm.conf; then
                log_step "Configurando Hyprland como sessão padrão..."
                sudo sed -i '/\[Autologin\]/a Session=hyprland' /etc/sddm.conf
            fi
        fi
    else
        log_info "SDDM não está habilitado"
    fi
    
    log_success "Hyprland configurado como sessão padrão"
    echo ""
}

# ============================================================================
# RECARREGAR APLICAÇÕES
# ============================================================================

reload_applications() {
    log_header "🔄 RECARREGANDO APLICAÇÕES"
    
    # Waybar
    if pgrep -x waybar > /dev/null; then
        log_step "Recarregando Waybar..."
        pkill -SIGUSR2 waybar
        log_success "Waybar recarregado"
    fi
    
    # Dunst
    if pgrep -x dunst > /dev/null; then
        log_step "Recarregando Dunst..."
        pkill dunst && dunst &>/dev/null &
        log_success "Dunst recarregado"
    fi
    
    # Hyprland (se estiver rodando)
    if pgrep -x Hyprland > /dev/null; then
        log_step "Recarregando Hyprland..."
        hyprctl reload &>/dev/null
        log_success "Hyprland recarregado"
    fi
    
    echo ""
}

# ============================================================================
# VALIDAÇÃO FINAL
# ============================================================================

validate_installation() {
    log_header "✅ VALIDAÇÃO FINAL"
    
    local errors=0
    
    # Verificar Hyprland
    if command -v Hyprland &> /dev/null; then
        log_success "Hyprland instalado"
    else
        log_error "Hyprland NÃO instalado"
        ((errors++))
    fi
    
    # Verificar configurações
    for dir in hypr waybar dunst rofi ghostty; do
        if [ -L "$HOME/.config/$dir" ]; then
            log_success "Configuração: $dir"
        else
            log_warning "Configuração ausente: $dir"
        fi
    done
    
    # Verificar scripts
    if [ -x "scripts/change-wallpaper.sh" ]; then
        log_success "Scripts executáveis"
    fi
    
    # Verificar SDDM
    if systemctl is-enabled sddm &> /dev/null; then
        log_success "SDDM habilitado"
    else
        log_warning "SDDM não habilitado (inicialização manual necessária)"
    fi
    
    echo ""
    
    if [ $errors -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

# ============================================================================
# RESUMO FINAL
# ============================================================================

show_final_summary() {
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                                                            ║${NC}"
    echo -e "${GREEN}║          ✨ INSTALAÇÃO COMPLETA! ✨                        ║${NC}"
    echo -e "${GREEN}║                                                            ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    log_info "O que foi instalado:"
    echo "   ✓ Hyprland + Wayland"
    echo "   ✓ Waybar (barras personalizadas)"
    echo "   ✓ Rofi (launcher com 5 menus)"
    echo "   ✓ Dunst (notificações)"
    echo "   ✓ Ghostty (terminal)"
    echo "   ✓ Nordzy Cursors"
    echo "   ✓ 30+ apps CLI"
    echo "   ✓ Wallust (temas dinâmicos)"
    echo "   ✓ SDDM (display manager)"
    echo ""
    
    log_info "Próximos passos:"
    echo ""
    echo "   1. ${CYAN}Reinicie o sistema:${NC}"
    echo "      ${WHITE}sudo reboot${NC}"
    echo ""
    echo "   2. ${CYAN}No SDDM:${NC}"
    echo "      • Digite seu usuário e senha 🔐"
    echo "      • Selecione 'Hyprland' no menu de sessão"
    echo ""
    echo "   3. ${CYAN}Teste os atalhos:${NC}"
    echo "      SUPER + R         → Rofi launcher"
    echo "      SUPER + SHIFT + S → Menu Sistema"
    echo "      SUPER + W         → Mudar wallpaper"
    echo ""
    echo "   4. ${CYAN}Leia a documentação:${NC}"
    echo "      bat ~/Dotfiles/KEYBINDINGS.md"
    echo "      bat ~/Dotfiles/WALLUST_GUIDE.md"
    echo ""
    
    log_warning "IMPORTANTE:"
    echo "   • Login sempre requer senha (configuração segura) 🔐"
    echo "   • Adicione wallpapers em: ~/Pictures/Wallpapers/"
    echo "   • Configure aliases no .zshrc: source ~/.zshrc"
    echo ""
    
    echo -e "${MAGENTA}════════════════════════════════════════════════════════════${NC}"
    echo -e "${MAGENTA}         Feito com 💙 para um Hyprland incrível!            ${NC}"
    echo -e "${MAGENTA}════════════════════════════════════════════════════════════${NC}"
    echo ""
}

# ============================================================================
# MAIN - EXECUÇÃO PRINCIPAL
# ============================================================================

main() {
    show_banner
    
    log_info "Este script irá:"
    echo "  • Instalar TODAS as dependências"
    echo "  • Configurar TODO o ambiente"
    echo "  • Criar TODOS os symlinks"
    echo "  • Configurar boot automático do Hyprland"
    echo ""
    
    if ! ask_confirmation "Continuar com a instalação completa?" "y"; then
        log_info "Instalação cancelada"
        exit 0
    fi
    
    # Verificações
    check_prerequisites
    
    # Backup
    backup_existing_configs
    
    # Instalação em fases
    install_phase1_system
    install_phase2_cursors
    install_phase3_cli_apps
    install_phase4_wallust
    
    # Configuração
    create_symlinks
    setup_sddm
    setup_secure_login
    setup_hyprland_default
    
    # Finalização
    reload_applications
    validate_installation
    
    # Resumo
    show_final_summary
}

# ============================================================================
# EXECUTAR
# ============================================================================

main "$@"
