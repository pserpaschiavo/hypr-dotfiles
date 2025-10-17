#!/usr/bin/env bash

## Menu de Rede - Rofi
## Gerenciamento de conexões de rede

ROFI_DIR="$HOME/.config/rofi/files/launchers/type-3"

# Opções
option_1="  Wi-Fi Manager"
option_2="  Bluetooth Manager"
option_3="  Firewall"
option_4="  Teste de Velocidade"
option_5="  Ping Monitor"
option_6="  Navegador Web"
option_7="  VPN"

options="$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6\n$option_7"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "Rede" -theme "$ROFI_DIR/style-1.rasi")"

case $chosen in
    $option_1)
        ghostty -e nmtui
        ;;
    $option_2)
        ghostty -e bluetui
        ;;
    $option_3)
        ghostty -e sudo ufw status
        ;;
    $option_4)
        ghostty -e speedtest-cli
        ;;
    $option_5)
        ghostty -e gping 8.8.8.8
        ;;
    $option_6)
        firefox
        ;;
    $option_7)
        nm-connection-editor
        ;;
esac
