#!/bin/bash

# Pega o nome completo do dispositivo
DEVICENAME=$(wpctl inspect @DEFAULT_AUDIO_SOURCE@ | grep 'node.description' | cut -d '"' -f 2)

# Pega a informação de volume/mudo
VOLUME_INFO=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

# Monta a string do tooltip baseada no estado
if echo "$VOLUME_INFO" | grep -q "MUTED"; then
    printf "$DEVICENAME" "%s Muted"
else
    VOLUME_PERCENT=$(echo "$VOLUME_INFO" | awk '{print $2 * 100}' | xargs printf "%.0f%%")
    printf "$DEVICENAME"
fi