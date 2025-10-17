#!/bin/bash

# ============================================================================
# Setup Wallust - Dynamic Theme Generator
# ============================================================================
# Installs and configures Wallust for automatic color scheme generation
# based on wallpapers

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Logging functions
log_step() {
    echo -e "${BLUE}[*]${NC} $1"
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
    echo -e "${CYAN}[i]${NC} $1"
}

# Banner
echo -e "${MAGENTA}"
cat << "EOF"
╦ ╦┌─┐┬  ┬  ┬ ┬┌─┐┌┬┐
║║║├─┤│  │  │ │└─┐ │ 
╚╩╝┴ ┴┴─┘┴─┘└─┘└─┘ ┴ 
Dynamic Theme Generator
EOF
echo -e "${NC}"

# ============================================================================
# 1. Check dependencies
# ============================================================================

log_step "Checking dependencies..."

if ! command -v yay &> /dev/null; then
    log_error "yay not found. Please install yay first."
    exit 1
fi

log_success "Dependencies OK"

# ============================================================================
# 2. Install Wallust
# ============================================================================

log_step "Installing Wallust..."

if command -v wallust &> /dev/null; then
    log_info "Wallust already installed: $(wallust --version)"
else
    yay -S --noconfirm wallust
    log_success "Wallust installed successfully"
fi

# ============================================================================
# 3. Create directory structure
# ============================================================================

log_step "Creating directory structure..."

WALLUST_DIR="$HOME/.config/wallust"
TEMPLATES_DIR="$WALLUST_DIR/templates"
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"

mkdir -p "$WALLUST_DIR"
mkdir -p "$TEMPLATES_DIR"
mkdir -p "$WALLPAPERS_DIR"

log_success "Directories created"

# ============================================================================
# 4. Create symlinks for templates
# ============================================================================

log_step "Creating symlinks for templates..."

DOTFILES_WALLUST="$HOME/Dotfiles/wallust/.config/wallust"

# Create wallust config directory in Dotfiles if it doesn't exist
mkdir -p "$DOTFILES_WALLUST/templates"

# If config exists in .config, backup and remove
if [ -d "$WALLUST_DIR" ] && [ ! -L "$WALLUST_DIR" ]; then
    log_warning "Backing up existing wallust config..."
    mv "$WALLUST_DIR" "${WALLUST_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Create symlink
ln -sf "$DOTFILES_WALLUST" "$HOME/.config/wallust"

log_success "Symlinks created"

# ============================================================================
# 5. Install pywal (optional but recommended)
# ============================================================================

log_step "Checking for pywal backend..."

if command -v wal &> /dev/null; then
    log_info "pywal already installed"
else
    log_info "Installing pywal for extended backend support..."
    sudo pacman -S --noconfirm python-pywal
    log_success "pywal installed"
fi

# ============================================================================
# 6. Set default wallpaper if none exists
# ============================================================================

log_step "Checking for wallpapers..."

if [ ! "$(ls -A $WALLPAPERS_DIR)" ]; then
    log_info "No wallpapers found. Creating sample wallpaper directory..."
    log_info "Add your wallpapers to: $WALLPAPERS_DIR"
fi

# ============================================================================
# 7. Test Wallust
# ============================================================================

log_step "Testing Wallust installation..."

if wallust --version &> /dev/null; then
    log_success "Wallust is working: $(wallust --version)"
else
    log_error "Wallust test failed"
    exit 1
fi

# ============================================================================
# Summary
# ============================================================================

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║           Wallust Setup Complete! 🎨                      ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
log_info "Configuration: $WALLUST_DIR"
log_info "Templates: $TEMPLATES_DIR"
log_info "Wallpapers: $WALLPAPERS_DIR"
echo ""
log_info "Next steps:"
echo "  1. Add wallpapers to: $WALLPAPERS_DIR"
echo "  2. Run: wallust run ~/Pictures/Wallpapers/your-image.jpg"
echo "  3. Or use: change-wallpaper.sh (script included)"
echo ""
log_warning "Note: Templates will be generated by the next steps"
echo ""
