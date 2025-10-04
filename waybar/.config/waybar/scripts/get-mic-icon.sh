#!/bin/bash

# Checa de forma super rápida se o microfone está mudo
if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED"; then
    # Se estiver mudo, retorna o JSON para o ícone de mudo
    echo '{"text": "", "class": "muted"}'
else
    # Se não, retorna o JSON para o ícone normal
    echo '{"text": "", "class": "unmuted"}'
fi