#!/usr/bin/env bash

## Script de Instalação de Aplicações CLI
## Workflow focado em teclado

echo "=========================================="
echo "   Instalação de Aplicações CLI"
echo "   Workflow Focado em Teclado"
echo "=========================================="
echo ""

# Cores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Função para verificar instalação
check_installed() {
    if pacman -Qi "$1" &> /dev/null || yay -Qi "$1" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1"
        return 0
    else
        echo -e "${YELLOW}⚠${NC} $1 (não instalado)"
        return 1
    fi
}

echo -e "${BLUE}=== PACOTES ESSENCIAIS ===${NC}"
echo ""

ESSENTIAL_PACMAN=(
    "yazi"                  # File manager TUI
    "btop"                  # System monitor
    "neovim"                # Text editor
    "lazygit"               # Git TUI
    "fzf"                   # Fuzzy finder
    "ripgrep"               # Fast grep
    "bat"                   # Cat with syntax
    "eza"                   # Modern ls
    "zoxide"                # Smart cd
    "playerctl"             # Media control
    "imagemagick"           # Image processing
    "ffmpegthumbnailer"     # Video thumbnails
    "poppler"               # PDF support
    "fd"                    # Find alternative
    "dust"                  # Disk usage
    "procs"                 # Process viewer
    "gping"                 # Ping with graph
    "speedtest-cli"         # Internet speed
    "github-cli"            # GitHub CLI
    "tig"                   # Git repository browser
)

ESSENTIAL_AUR=(
    "spotify-tui"           # Spotify TUI
    "bluetui"               # Bluetooth TUI
)

echo "Verificando pacotes essenciais (Repositório Oficial)..."
TO_INSTALL_PACMAN=()
for pkg in "${ESSENTIAL_PACMAN[@]}"; do
    if ! check_installed "$pkg"; then
        TO_INSTALL_PACMAN+=("$pkg")
    fi
done

echo ""
echo "Verificando pacotes essenciais (AUR)..."
TO_INSTALL_AUR=()
for pkg in "${ESSENTIAL_AUR[@]}"; do
    if ! check_installed "$pkg"; then
        TO_INSTALL_AUR+=("$pkg")
    fi
done

echo ""
echo -e "${BLUE}=== PACOTES OPCIONAIS ===${NC}"
echo ""

OPTIONAL_PACMAN=(
    "mpv"                   # Video player
    "cava"                  # Audio visualizer
    "chafa"                 # Image viewer
    "translate-shell"       # Translator
    "calcurse"              # Calendar
    "helix"                 # Modern text editor
)

OPTIONAL_AUR=(
    "taskwarrior-tui"       # Task manager
)

echo "Verificando pacotes opcionais (Repositório Oficial)..."
TO_INSTALL_OPT_PACMAN=()
for pkg in "${OPTIONAL_PACMAN[@]}"; do
    if ! check_installed "$pkg"; then
        TO_INSTALL_OPT_PACMAN+=("$pkg")
    fi
done

echo ""
echo "Verificando pacotes opcionais (AUR)..."
TO_INSTALL_OPT_AUR=()
for pkg in "${OPTIONAL_AUR[@]}"; do
    if ! check_installed "$pkg"; then
        TO_INSTALL_OPT_AUR+=("$pkg")
    fi
done

echo ""
echo "=========================================="
echo "RESUMO:"
echo "=========================================="
echo -e "${YELLOW}Essenciais (Oficial):${NC} ${#TO_INSTALL_PACMAN[@]} pacotes"
echo -e "${YELLOW}Essenciais (AUR):${NC} ${#TO_INSTALL_AUR[@]} pacotes"
echo -e "${YELLOW}Opcionais (Oficial):${NC} ${#TO_INSTALL_OPT_PACMAN[@]} pacotes"
echo -e "${YELLOW}Opcionais (AUR):${NC} ${#TO_INSTALL_OPT_AUR[@]} pacotes"
echo ""

# Instalar essenciais
if [ ${#TO_INSTALL_PACMAN[@]} -gt 0 ] || [ ${#TO_INSTALL_AUR[@]} -gt 0 ]; then
    read -p "Instalar pacotes ESSENCIAIS? (s/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        if [ ${#TO_INSTALL_PACMAN[@]} -gt 0 ]; then
            echo "Instalando pacotes essenciais (Oficial)..."
            sudo pacman -S --needed "${TO_INSTALL_PACMAN[@]}"
        fi
        
        if [ ${#TO_INSTALL_AUR[@]} -gt 0 ]; then
            echo "Instalando pacotes essenciais (AUR)..."
            yay -S --needed "${TO_INSTALL_AUR[@]}"
        fi
    fi
fi

# Instalar opcionais
if [ ${#TO_INSTALL_OPT_PACMAN[@]} -gt 0 ] || [ ${#TO_INSTALL_OPT_AUR[@]} -gt 0 ]; then
    echo ""
    read -p "Instalar pacotes OPCIONAIS? (s/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        if [ ${#TO_INSTALL_OPT_PACMAN[@]} -gt 0 ]; then
            echo "Instalando pacotes opcionais (Oficial)..."
            sudo pacman -S --needed "${TO_INSTALL_OPT_PACMAN[@]}"
        fi
        
        if [ ${#TO_INSTALL_OPT_AUR[@]} -gt 0 ]; then
            echo "Instalando pacotes opcionais (AUR)..."
            yay -S --needed "${TO_INSTALL_OPT_AUR[@]}"
        fi
    fi
fi

echo ""
echo "=========================================="
echo "   Configurando Aliases no Zsh"
echo "=========================================="
echo ""

ZSHRC="$HOME/.zshrc"

# Backup do .zshrc
if [ -f "$ZSHRC" ]; then
    cp "$ZSHRC" "$ZSHRC.backup.$(date +%Y%m%d_%H%M%S)"
    echo "✓ Backup do .zshrc criado"
fi

# Adicionar aliases se não existirem
if ! grep -q "# CLI Apps Aliases" "$ZSHRC" 2>/dev/null; then
    cat >> "$ZSHRC" << 'EOF'

# CLI Apps Aliases
alias fm='yazi'              # File manager
alias mon='btop'             # System monitor  
alias lg='lazygit'           # Git TUI
alias ls='eza --icons'       # Better ls
alias ll='eza --icons -l'    # Long listing
alias la='eza --icons -la'   # All files
alias lt='eza --icons --tree --level=2'  # Tree view
alias cat='bat'              # Cat with syntax
alias vim='nvim'             # Use neovim
alias music='spt'            # Spotify TUI
alias bt='bluetui'           # Bluetooth TUI
alias net='nmtui'            # Network TUI

# Zoxide (smart cd)
eval "$(zoxide init zsh)"
alias cd='z'

# FZF key bindings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

EOF
    echo "✓ Aliases adicionados ao .zshrc"
else
    echo "⚠ Aliases já existem no .zshrc"
fi

echo ""
echo "=========================================="
echo "   Configurando Yazi"
echo "=========================================="
echo ""

# Configurar Yazi
mkdir -p ~/.config/yazi

if [ ! -f ~/.config/yazi/yazi.toml ]; then
    cat > ~/.config/yazi/yazi.toml << 'EOF'
[manager]
show_hidden = false
sort_by = "natural"
sort_dir_first = true
linemode = "size"

[preview]
image_filter = "lanczos3"
image_quality = 80
max_width = 600
max_height = 900

[opener]
edit = [
    { exec = 'nvim "$@"', block = true }
]

[plugin]
prepend_previewers = [
    { mime = "text/*", run = "bat" },
    { mime = "image/*", run = "chafa" }
]
EOF
    echo "✓ Configuração do Yazi criada"
else
    echo "⚠ Configuração do Yazi já existe"
fi

echo ""
echo "=========================================="
echo "✓ Instalação Concluída!"
echo "=========================================="
echo ""
echo "Próximos passos:"
echo "1. Recarregue o shell: source ~/.zshrc"
echo "2. Teste os comandos:"
echo "   - fm        (File Manager - Yazi)"
echo "   - mon       (System Monitor - btop)"
echo "   - lg        (Git TUI - Lazygit)"
echo "   - music     (Spotify TUI)"
echo ""
echo "Documentação completa em: CLI_APPS_GUIDE.md"
echo ""
