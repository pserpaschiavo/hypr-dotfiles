#!/usr/bin/env bash

## Menu de Desenvolvimento - Rofi
## Ferramentas para programação

ROFI_DIR="$HOME/.config/rofi/files/launchers/type-2"

# Opções
option_1="  VS Code"
option_2="  Neovim"
option_3="  Lazygit"
option_4="  Terminal"
option_5="  GitHub CLI"
option_6="  Docker Desktop"
option_7="  Gerenciador de BD"

options="$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6\n$option_7"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "Desenvolvimento" -theme "$ROFI_DIR/style-1.rasi")"

case $chosen in
    $option_1)
        code
        ;;
    $option_2)
        ghostty -e nvim
        ;;
    $option_3)
        ghostty -e lazygit
        ;;
    $option_4)
        ghostty
        ;;
    $option_5)
        ghostty -e gh
        ;;
    $option_6)
        notify-send "Docker" "Funcionalidade em desenvolvimento"
        ;;
    $option_7)
        notify-send "Database" "Funcionalidade em desenvolvimento"
        ;;
esac
