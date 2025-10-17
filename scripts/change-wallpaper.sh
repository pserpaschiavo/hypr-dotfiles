#!/bin/bash

# ============================================================================
# Change Wallpaper and Generate Color Scheme
# ============================================================================
# This script changes your wallpaper and automatically generates a matching
# color scheme using Wallust

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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

log_info() {
    echo -e "${CYAN}[i]${NC} $1"
}

# ============================================================================
# Configuration
# ============================================================================

WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"
WALLPAPER_CACHE="$HOME/.cache/current_wallpaper"

# ============================================================================
# Functions
# ============================================================================

# Show usage
show_usage() {
    echo "Usage: change-wallpaper.sh [OPTIONS] [IMAGE]"
    echo ""
    echo "Options:"
    echo "  -h, --help        Show this help message"
    echo "  -r, --random      Select a random wallpaper from $WALLPAPERS_DIR"
    echo "  -l, --last        Use the last wallpaper"
    echo "  -s, --select      Interactive selection using rofi"
    echo "  IMAGE             Path to specific wallpaper image"
    echo ""
    echo "Examples:"
    echo "  change-wallpaper.sh -r                    # Random wallpaper"
    echo "  change-wallpaper.sh -s                    # Select with rofi"
    echo "  change-wallpaper.sh ~/path/to/image.jpg   # Specific image"
}

# Select wallpaper interactively with rofi
select_with_rofi() {
    if ! command -v rofi &> /dev/null; then
        log_error "rofi not found. Install rofi or use another method."
        exit 1
    fi
    
    cd "$WALLPAPERS_DIR" || exit 1
    
    # Find all image files
    local images=$(find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -printf "%f\n" | sort)
    
    if [ -z "$images" ]; then
        log_error "No wallpapers found in $WALLPAPERS_DIR"
        exit 1
    fi
    
    # Show rofi menu
    local selected=$(echo "$images" | rofi -dmenu -i -p "Select Wallpaper" -theme-str 'window {width: 40%;}')
    
    if [ -n "$selected" ]; then
        echo "$WALLPAPERS_DIR/$selected"
    else
        log_error "No wallpaper selected"
        exit 1
    fi
}

# Get random wallpaper
get_random_wallpaper() {
    if [ ! -d "$WALLPAPERS_DIR" ]; then
        log_error "Wallpapers directory not found: $WALLPAPERS_DIR"
        exit 1
    fi
    
    local images=$(find "$WALLPAPERS_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) )
    
    if [ -z "$images" ]; then
        log_error "No wallpapers found in $WALLPAPERS_DIR"
        exit 1
    fi
    
    echo "$images" | shuf -n 1
}

# Apply wallpaper with hyprpaper
apply_wallpaper() {
    local wallpaper="$1"
    
    if [ ! -f "$wallpaper" ]; then
        log_error "Wallpaper file not found: $wallpaper"
        exit 1
    fi
    
    log_step "Applying wallpaper: $(basename "$wallpaper")"
    
    # Kill existing hyprpaper
    pkill hyprpaper 2>/dev/null || true
    sleep 0.5
    
    # Create hyprpaper config
    cat > /tmp/hyprpaper.conf <<EOF
preload = $wallpaper
wallpaper = ,$wallpaper
splash = false
EOF
    
    # Start hyprpaper with new config
    hyprpaper -c /tmp/hyprpaper.conf &>/dev/null &
    
    # Save current wallpaper
    echo "$wallpaper" > "$WALLPAPER_CACHE"
    
    log_success "Wallpaper applied"
}

# Generate colors with wallust
generate_colors() {
    local wallpaper="$1"
    
    if ! command -v wallust &> /dev/null; then
        log_error "wallust not found. Run: ./scripts/setup-wallust.sh"
        exit 1
    fi
    
    log_step "Generating color scheme with Wallust..."
    
    # Run wallust
    wallust run "$wallpaper"
    
    log_success "Color scheme generated"
}

# Reload applications
reload_apps() {
    log_step "Reloading applications..."
    
    # Reload waybar
    if pgrep -x waybar > /dev/null; then
        pkill -SIGUSR2 waybar
        log_success "Waybar reloaded"
    fi
    
    # Reload dunst
    if pgrep -x dunst > /dev/null; then
        pkill dunst && dunst &>/dev/null &
        log_success "Dunst reloaded"
    fi
    
    # Reload hyprland (for border colors if configured)
    hyprctl reload &>/dev/null
    log_success "Hyprland reloaded"
    
    log_info "Note: Restart Ghostty and Rofi to see new colors"
}

# ============================================================================
# Main
# ============================================================================

# Check if no arguments
if [ $# -eq 0 ]; then
    show_usage
    exit 0
fi

# Parse arguments
case "$1" in
    -h|--help)
        show_usage
        exit 0
        ;;
    -r|--random)
        WALLPAPER=$(get_random_wallpaper)
        ;;
    -l|--last)
        if [ -f "$WALLPAPER_CACHE" ]; then
            WALLPAPER=$(cat "$WALLPAPER_CACHE")
        else
            log_error "No last wallpaper found"
            exit 1
        fi
        ;;
    -s|--select)
        WALLPAPER=$(select_with_rofi)
        ;;
    *)
        # Assume it's a path to an image
        WALLPAPER="$1"
        ;;
esac

# Validate wallpaper exists
if [ ! -f "$WALLPAPER" ]; then
    log_error "Wallpaper not found: $WALLPAPER"
    exit 1
fi

# Main execution
echo ""
log_info "Changing wallpaper and generating colors..."
echo ""

apply_wallpaper "$WALLPAPER"
generate_colors "$WALLPAPER"
reload_apps

echo ""
log_success "All done! Your environment now matches your wallpaper 🎨"
echo ""
log_info "Current wallpaper: $(basename "$WALLPAPER")"
echo ""
