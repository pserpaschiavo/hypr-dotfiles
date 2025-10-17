#!/usr/bin/env bash

## Script de Instalação de Dependências - Fase 1
## Sistema Base do Hyprland

echo "=========================================="
echo "   Instalação de Dependências - Fase 1"
echo "   Sistema Base do Hyprland"
echo "=========================================="
echo ""

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Função para verificar se um pacote está instalado
check_installed() {
    if pacman -Qi "$1" &> /dev/null || yay -Qi "$1" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1 já está instalado"
        return 0
    else
        echo -e "${YELLOW}⚠${NC} $1 não está instalado"
        return 1
    fi
}

# Verificar se yay está instalado
if ! command -v yay &> /dev/null; then
    echo -e "${RED}✗${NC} yay (AUR helper) não está instalado!"
    echo "Instalando yay..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
else
    echo -e "${GREEN}✓${NC} yay está instalado"
fi

echo ""
echo "Verificando dependências do sistema base..."
echo ""

# Lista de pacotes do repositório oficial
PACMAN_PACKAGES=(
    "hyprland"
    "hyprpaper"
    "hyprlock"
    "hypridle"
    "waybar"
    "dunst"
    "rofi-wayland"
    "thunar"
    "thunar-archive-plugin"
    "thunar-media-tags-plugin"
    "grim"
    "slurp"
    "wl-clipboard"
    "cliphist"
    "hyprpicker"
    "swappy"
    "imagemagick"
    "jq"
    "brightnessctl"
    "playerctl"
    "pavucontrol"
    "blueman"
    "networkmanager"
    "nm-connection-editor"
    "polkit-kde-agent"
    "pipewire"
    "pipewire-pulse"
    "pipewire-alsa"
    "pipewire-jack"
    "wireplumber"
    "qt6ct"
    "qt5ct"
    "kvantum"
    "gtk-engine-murrine"
    "papirus-icon-theme"
    "ttf-jetbrains-mono-nerd"
    "ttf-firacode-nerd"
    "noto-fonts"
    "noto-fonts-emoji"
    "firefox"
)

# Lista de pacotes do AUR
AUR_PACKAGES=(
    "ghostty"
    "bluetui"
    "nwg-look"
    "sddm-sugar-candy-git"
    "wallust"
)

# Verificar pacotes do repositório oficial
TO_INSTALL_PACMAN=()
for package in "${PACMAN_PACKAGES[@]}"; do
    if ! check_installed "$package"; then
        TO_INSTALL_PACMAN+=("$package")
    fi
done

# Verificar pacotes do AUR
TO_INSTALL_AUR=()
for package in "${AUR_PACKAGES[@]}"; do
    if ! check_installed "$package"; then
        TO_INSTALL_AUR+=("$package")
    fi
done

echo ""
echo "=========================================="
echo "Resumo:"
echo "=========================================="
echo -e "${YELLOW}Pacotes oficiais a instalar:${NC} ${#TO_INSTALL_PACMAN[@]}"
echo -e "${YELLOW}Pacotes AUR a instalar:${NC} ${#TO_INSTALL_AUR[@]}"
echo ""

# Perguntar se deseja instalar
if [ ${#TO_INSTALL_PACMAN[@]} -gt 0 ] || [ ${#TO_INSTALL_AUR[@]} -gt 0 ]; then
    read -p "Deseja instalar os pacotes faltantes? (s/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        # Instalar pacotes oficiais
        if [ ${#TO_INSTALL_PACMAN[@]} -gt 0 ]; then
            echo ""
            echo "Instalando pacotes oficiais..."
            sudo pacman -S --needed "${TO_INSTALL_PACMAN[@]}"
        fi
        
        # Instalar pacotes do AUR
        if [ ${#TO_INSTALL_AUR[@]} -gt 0 ]; then
            echo ""
            echo "Instalando pacotes do AUR..."
            yay -S --needed "${TO_INSTALL_AUR[@]}"
        fi
        
        echo ""
        echo -e "${GREEN}✓${NC} Instalação concluída!"
    else
        echo "Instalação cancelada."
    fi
else
    echo -e "${GREEN}✓${NC} Todas as dependências já estão instaladas!"
fi

echo ""
echo "=========================================="
echo "Habilitando serviços..."
echo "=========================================="

# Habilitar serviços necessários
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now NetworkManager.service

echo ""
echo -e "${GREEN}✓${NC} Fase 1 concluída!"
echo ""
echo "Próximos passos:"
echo "1. Configurar SDDM: sudo systemctl enable sddm.service"
echo "2. Aplicar symlinks dos dotfiles"
echo "3. Recarregar Hyprland: hyprctl reload"
echo ""
