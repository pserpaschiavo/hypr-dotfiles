#!/usr/bin/env bash

##############################################
#                                            #
#    🎨 HYPRLAND DOTFILES - SETUP MASTER    #
#    Instalação e Configuração Completa     #
#                                            #
##############################################

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Banner
clear
echo -e "${CYAN}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║     🎨  HYPRLAND DOTFILES - CONFIGURAÇÃO COMPLETA  🎨    ║
║                                                           ║
║     Sistema bonito, funcional e acessível                ║
║     Workflow focado em teclado                           ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

sleep 2

# Verificar se está no diretório correto
if [ ! -f "scripts/setup-master.sh" ]; then
    echo -e "${RED}✗ Execute este script do diretório Dotfiles!${NC}"
    echo "  cd ~/Dotfiles && ./scripts/setup-master.sh"
    exit 1
fi

echo -e "${YELLOW}Este script irá:${NC}"
echo "  1. Instalar todas as dependências necessárias"
echo "  2. Configurar cursores (Nordzy)"
echo "  3. Instalar aplicações CLI essenciais"
echo "  4. Configurar Dunst (notificações)"
echo "  5. Aplicar configurações do Waybar"
echo "  6. Configurar Hyprland completo"
echo "  7. Criar symlinks para ~/.config"
echo ""
read -p "Deseja continuar? (s/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Ss]$ ]]; then
    echo -e "${YELLOW}Instalação cancelada.${NC}"
    exit 0
fi

# Função de log
log_step() {
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC} ${WHITE}$1${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    echo ""
}

log_success() {
    echo -e "${GREEN}✓${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

log_info() {
    echo -e "${CYAN}→${NC} $1"
}

# Backup de configurações existentes
backup_configs() {
    log_step "📦 Fazendo backup de configurações existentes"
    
    BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    for dir in hypr waybar dunst rofi ghostty; do
        if [ -d "$HOME/.config/$dir" ]; then
            log_info "Backup: ~/.config/$dir"
            cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
        fi
    done
    
    log_success "Backup salvo em: $BACKUP_DIR"
}

# 1. Instalar dependências
log_step "📦 FASE 1: Instalação de Dependências"

if [ -f "scripts/install-phase1.sh" ]; then
    log_info "Executando install-phase1.sh..."
    bash scripts/install-phase1.sh
else
    log_error "Script install-phase1.sh não encontrado!"
fi

# 2. Configurar cursores
log_step "🖱️  FASE 2: Configuração de Cursores"

if [ -f "scripts/setup-cursors.sh" ]; then
    log_info "Executando setup-cursors.sh..."
    bash scripts/setup-cursors.sh
else
    log_error "Script setup-cursors.sh não encontrado!"
fi

# 3. Instalar apps CLI
log_step "🖥️  FASE 3: Aplicações CLI"

if [ -f "scripts/install-cli-apps.sh" ]; then
    log_info "Executando install-cli-apps.sh..."
    bash scripts/install-cli-apps.sh
else
    log_error "Script install-cli-apps.sh não encontrado!"
fi

# 3.5. Configurar Wallust
log_step "🎨 FASE 3.5: Wallust (Temas Dinâmicos)"

if [ -f "scripts/setup-wallust.sh" ]; then
    log_info "Executando setup-wallust.sh..."
    bash scripts/setup-wallust.sh
else
    log_error "Script setup-wallust.sh não encontrado!"
fi

# 4. Criar symlinks
log_step "🔗 FASE 4: Criando Symlinks"

backup_configs

log_info "Criando symlinks para ~/.config..."

# Remove symlinks antigos se existirem
for dir in hypr waybar dunst rofi ghostty; do
    if [ -L "$HOME/.config/$dir" ]; then
        rm "$HOME/.config/$dir"
    fi
done

# Criar symlinks
ln -sf "$PWD/hypr/.config/hypr" "$HOME/.config/hypr"
log_success "Hyprland configurado"

ln -sf "$PWD/waybar/.config/waybar" "$HOME/.config/waybar"
log_success "Waybar configurado"

ln -sf "$PWD/dunst/.config/dunst" "$HOME/.config/dunst"
log_success "Dunst configurado"

ln -sf "$PWD/rofi/.config/rofi" "$HOME/.config/rofi"
log_success "Rofi configurado"

ln -sf "$PWD/ghostty/.config/ghostty" "$HOME/.config/ghostty"
log_success "Ghostty configurado"

ln -sf "$PWD/hyprpaper/.config/hypr/hyprpaper.conf" "$HOME/.config/hypr/hyprpaper.conf"
log_success "Hyprpaper configurado"

# 5. Configurar SDDM (opcional)
log_step "🔐 FASE 5: Display Manager (SDDM)"

read -p "Deseja configurar SDDM? (s/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    if [ -f "scripts/setup-sddm.sh" ]; then
        bash scripts/setup-sddm.sh
    fi
fi

# 6. Recarregar serviços
log_step "🔄 FASE 6: Recarregando Serviços"

log_info "Recarregando Waybar..."
killall waybar 2>/dev/null
waybar &
log_success "Waybar reiniciado"

log_info "Recarregando Dunst..."
killall dunst 2>/dev/null
dunst &
log_success "Dunst reiniciado"

if pgrep -x "Hyprland" > /dev/null; then
    log_info "Recarregando Hyprland..."
    hyprctl reload
    log_success "Hyprland recarregado"
fi

# 7. Verificar instalação
log_step "✅ FASE 7: Verificação Final"

echo ""
echo -e "${CYAN}Verificando componentes instalados:${NC}"
echo ""

check_component() {
    if command -v "$1" &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} $2"
    else
        echo -e "  ${RED}✗${NC} $2 ${YELLOW}(não instalado)${NC}"
    fi
}

check_component "hyprland" "Hyprland"
check_component "waybar" "Waybar"
check_component "dunst" "Dunst"
check_component "rofi" "Rofi"
check_component "ghostty" "Ghostty"
check_component "yazi" "Yazi"
check_component "btop" "btop"
check_component "lazygit" "Lazygit"
check_component "fzf" "fzf"
check_component "bat" "bat"
check_component "eza" "eza"

# Finalização
log_step "🎉 INSTALAÇÃO CONCLUÍDA!"

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${NC}  ${WHITE}✨ Ambiente Hyprland Configurado com Sucesso! ✨${NC}        ${GREEN}║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}Próximos passos:${NC}"
echo ""
echo -e "  ${YELLOW}1.${NC} Faça logout e login novamente"
echo -e "     ${WHITE}ou recarregue o shell:${NC} source ~/.zshrc"
echo ""
echo -e "  ${YELLOW}2.${NC} Teste os atalhos de teclado:"
echo -e "     ${WHITE}SUPER + R${NC}         - Launcher"
echo -e "     ${WHITE}SUPER + SHIFT + S${NC} - Menu Sistema"
echo -e "     ${WHITE}SUPER + SHIFT + N${NC} - Menu Rede"
echo -e "     ${WHITE}SUPER + SHIFT + M${NC} - Menu Mídia"
echo -e "     ${WHITE}SUPER + SHIFT + D${NC} - Menu Dev"
echo -e "     ${WHITE}SUPER + SHIFT + U${NC} - Menu Utilitários"
echo ""
echo -e "  ${YELLOW}3.${NC} Teste as aplicações CLI:"
echo -e "     ${WHITE}fm${NC}    - File Manager (Yazi)"
echo -e "     ${WHITE}mon${NC}   - System Monitor (btop)"
echo -e "     ${WHITE}lg${NC}    - Git TUI (Lazygit)"
echo -e "     ${WHITE}music${NC} - Spotify TUI"
echo ""
echo -e "  ${YELLOW}4.${NC} Documentação:"
echo -e "     ${WHITE}WORKPLAN.md${NC}       - Status do projeto"
echo -e "     ${WHITE}CLI_APPS_GUIDE.md${NC} - Guia de apps CLI"
echo -e "     ${WHITE}README.md${NC}         - Documentação geral"
echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Aproveite seu novo ambiente! 🚀${NC}"
echo ""
