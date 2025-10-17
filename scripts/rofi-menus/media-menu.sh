#!/usr/bin/env bash

## Menu de Mídia - Rofi
## Aplicações de música, vídeo e criatividade

ROFI_DIR="$HOME/.config/rofi/files/launchers/type-5"

# Opções
option_1="  Spotify"
option_2="  Spotify TUI"
option_3="  Visualizador de Áudio"
option_4="  Player de Vídeo"
option_5="  Editor de Imagens"
option_6="  Editor Vetorial"
option_7="  Controle de Volume"

options="$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6\n$option_7"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "Mídia" -theme "$ROFI_DIR/style-1.rasi")"

case $chosen in
    $option_1)
        spotify-launcher
        ;;
    $option_2)
        ghostty -e spt
        ;;
    $option_3)
        ghostty -e cava
        ;;
    $option_4)
        mpv
        ;;
    $option_5)
        gimp
        ;;
    $option_6)
        inkscape
        ;;
    $option_7)
        pavucontrol
        ;;
esac
