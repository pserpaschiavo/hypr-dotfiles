#!/usr/bin/env bash

## Menu de Sistema - Rofi
## Gerenciamento de configurações e sistema

# Diretório do Rofi
ROFI_DIR="$HOME/.config/rofi/files/launchers/type-2"

# Opções do menu
option_1="  Monitor de Sistema"
option_2="  Gerenciador de Arquivos"
option_3="  Configurações GTK"
option_4="  Configurações Qt"
option_5="  Gerenciador de Pacotes"
option_6="  Temas e Aparência"
option_7="  Monitores e Display"
option_8="  Discos e Partições"

# Variável de menu
options="$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6\n$option_7\n$option_8"

# Executar Rofi
chosen="$(echo -e "$options" | rofi -dmenu -i -p "Sistema" -theme "$ROFI_DIR/style-1.rasi")"

# Ações baseadas na escolha
case $chosen in
    $option_1)
        ghostty -e btop
        ;;
    $option_2)
        ghostty -e yazi
        ;;
    $option_3)
        nwg-look
        ;;
    $option_4)
        qt6ct
        ;;
    $option_5)
        ghostty -e yay
        ;;
    $option_6)
        nwg-look
        ;;
    $option_7)
        wdisplays
        ;;
    $option_8)
        ghostty -e gparted
        ;;
esac
