#!/usr/bin/env bash

## Script de Screenshots para Hyprland
## Requer: grim, slurp, wl-clipboard, notify-send, swappy (opcional)

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

TIMESTAMP=$(date +'%Y%m%d_%H%M%S')

# Função de notificação
notify() {
    notify-send -u normal -i camera-photo "Screenshot" "$1"
}

# Opções do menu
option1="  Capturar Área"
option2="  Capturar Janela"
option3="  Capturar Tela Cheia"
option4="  Capturar Área (Editar)"
option5="  Capturar Tela (Salvar)"

# Mostrar menu Rofi
choice=$(echo -e "$option1\n$option2\n$option3\n$option4\n$option5" | rofi -dmenu -i -p "Screenshot" -theme ~/.config/rofi/launchers/type-1/style-1.rasi)

case $choice in
    "$option1")
        # Capturar área selecionada e copiar para clipboard
        grim -g "$(slurp)" - | wl-copy
        notify "Área copiada para o clipboard"
        ;;
    "$option2")
        # Capturar janela ativa e copiar para clipboard
        # Obtém geometria da janela ativa
        WINDOW=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$WINDOW" - | wl-copy
        notify "Janela copiada para o clipboard"
        ;;
    "$option3")
        # Capturar tela cheia e copiar para clipboard
        grim - | wl-copy
        notify "Tela copiada para o clipboard"
        ;;
    "$option4")
        # Capturar área e editar com swappy
        grim -g "$(slurp)" - | swappy -f -
        notify "Screenshot capturado e editado"
        ;;
    "$option5")
        # Capturar área e salvar em arquivo
        FILE="$DIR/screenshot_$TIMESTAMP.png"
        grim -g "$(slurp)" "$FILE"
        notify "Screenshot salvo em $FILE"
        ;;
    *)
        exit 1
        ;;
esac
