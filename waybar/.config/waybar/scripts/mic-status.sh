#!/bin/bash

# Pega o nome do dispositivo de entrada (microfone) padrão
DEVICENAME=$(wpctl inspect @DEFAULT_AUDIO_SOURCE@ | grep 'node.description' | cut -d '"' -f 2)

# Pega o volume e o estado de "mudo"
VOLUME_INFO=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

# Verifica se a saída contém a palavra "MUTED"
if echo "$VOLUME_INFO" | grep -q "MUTED"; then
    CLASS="muted"
    TEXT="  Muted"
    TOOLTIP="$DEVICENAME (Muted)"
else
    # Extrai apenas o valor do volume (ex: 0.70)
    VOLUME=$(echo "$VOLUME_INFO" | awk '{print $2}')
    # Converte para porcentagem (ex: 70)
    PERCENTAGE=$(printf "%.0f" $(echo "$VOLUME * 100" | bc))

    CLASS="unmuted"
    TEXT=" $PERCENTAGE%"
    TOOLTIP="$DEVICENAME"
fi

# Imprime a saída em formato JSON, que o Waybar vai entender
printf '{"text": "%s", "tooltip": "%s", "class": "%s"}\n' "$TEXT" "$TOOLTIP" "$CLASS"