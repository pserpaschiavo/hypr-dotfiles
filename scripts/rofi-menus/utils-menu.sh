#!/usr/bin/env bash

## Menu de Utilitários - Rofi
## Ferramentas rápidas e úteis

ROFI_DIR="$HOME/.config/rofi/files/applets/type-5"

# Opções
option_1="  Screenshot"
option_2="  Color Picker"
option_3="  Clipboard"
option_4="  Calculadora"
option_5="  Calendário"
option_6="  Tradutor"
option_7="  Brilho"
option_8="  Volume"

options="$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6\n$option_7\n$option_8"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "Utilitários" -theme "$ROFI_DIR/style-1.rasi")"

case $chosen in
    $option_1)
        ~/.config/rofi/files/applets/bin/screenshot.sh
        ;;
    $option_2)
        hyprpicker -a && notify-send "Color Picker" "Cor copiada para o clipboard"
        ;;
    $option_3)
        cliphist list | rofi -dmenu -p "Clipboard" -theme "$ROFI_DIR/style-1.rasi" | cliphist decode | wl-copy
        ;;
    $option_4)
        rofi -show calc -modi calc -no-show-match -no-sort
        ;;
    $option_5)
        ghostty -e calcurse
        ;;
    $option_6)
        translation=$(echo "" | rofi -dmenu -p "Traduzir (EN>PT)" -theme "$ROFI_DIR/style-1.rasi")
        if [ -n "$translation" ]; then
            result=$(trans en:pt "$translation" -b)
            notify-send "Tradução" "$result"
        fi
        ;;
    $option_7)
        ~/.config/rofi/files/applets/bin/brightness.sh
        ;;
    $option_8)
        ~/.config/rofi/files/applets/bin/volume.sh
        ;;
esac
