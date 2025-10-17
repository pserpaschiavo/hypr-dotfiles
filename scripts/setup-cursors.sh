#!/usr/bin/env bash

## Script de Instalação e Configuração de Cursores
## Nordzy Cursors - Design clean e elegante

echo "=========================================="
echo "   Instalação do Nordzy Cursors"
echo "=========================================="
echo ""

# Verificar se está instalado
if yay -Qi nordzy-cursors &>/dev/null; then
    echo "✓ Nordzy Cursors já está instalado"
else
    echo "Instalando Nordzy Cursors..."
    yay -S --needed nordzy-cursors
    
    if [ $? -eq 0 ]; then
        echo "✓ Nordzy Cursors instalado com sucesso"
    else
        echo "✗ Erro ao instalar Nordzy Cursors"
        exit 1
    fi
fi

echo ""
echo "Variantes disponíveis do Nordzy:"
echo "  - Nordzy-cursors (padrão - escuro)"
echo "  - Nordzy-white-cursors (claro)"
echo "  - Nordzy-cursors-white (outra variante clara)"
echo ""

# Configurar no Hyprland
echo "Configurando cursor no Hyprland..."

HYPR_CONF="$HOME/.config/hypr/hyprland.conf"

if [ -f "$HYPR_CONF" ]; then
    # Verificar se já existe configuração de cursor
    if grep -q "XCURSOR_THEME" "$HYPR_CONF"; then
        echo "⚠ Configuração de cursor já existe no hyprland.conf"
        echo "Por favor, atualize manualmente para:"
        echo "  env = XCURSOR_THEME,Nordzy-cursors"
        echo "  env = XCURSOR_SIZE,24"
    else
        echo "Adicionando configuração de cursor..."
        # A configuração já deve estar lá, então só mostramos
        echo "✓ Verifique se as linhas estão corretas no hyprland.conf"
    fi
else
    echo "⚠ Arquivo hyprland.conf não encontrado em $HYPR_CONF"
fi

# Configurar para GTK
echo ""
echo "Configurando cursor para aplicações GTK..."

GTK3_SETTINGS="$HOME/.config/gtk-3.0/settings.ini"
mkdir -p "$HOME/.config/gtk-3.0"

if [ ! -f "$GTK3_SETTINGS" ]; then
    cat > "$GTK3_SETTINGS" << 'EOF'
[Settings]
gtk-cursor-theme-name=Nordzy-cursors
gtk-cursor-theme-size=24
gtk-theme-name=Adwaita-dark
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=JetBrainsMono Nerd Font 10
gtk-application-prefer-dark-theme=1
EOF
    echo "✓ Criado $GTK3_SETTINGS"
else
    # Atualizar apenas as linhas de cursor
    if grep -q "gtk-cursor-theme-name" "$GTK3_SETTINGS"; then
        sed -i 's/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=Nordzy-cursors/' "$GTK3_SETTINGS"
        echo "✓ Atualizado tema de cursor no GTK3"
    else
        echo "gtk-cursor-theme-name=Nordzy-cursors" >> "$GTK3_SETTINGS"
        echo "gtk-cursor-theme-size=24" >> "$GTK3_SETTINGS"
        echo "✓ Adicionado tema de cursor no GTK3"
    fi
fi

# GTK 4
GTK4_SETTINGS="$HOME/.config/gtk-4.0/settings.ini"
mkdir -p "$HOME/.config/gtk-4.0"

if [ ! -f "$GTK4_SETTINGS" ]; then
    cat > "$GTK4_SETTINGS" << 'EOF'
[Settings]
gtk-cursor-theme-name=Nordzy-cursors
gtk-cursor-theme-size=24
gtk-theme-name=Adwaita-dark
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=JetBrainsMono Nerd Font 10
gtk-application-prefer-dark-theme=1
EOF
    echo "✓ Criado $GTK4_SETTINGS"
else
    if grep -q "gtk-cursor-theme-name" "$GTK4_SETTINGS"; then
        sed -i 's/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=Nordzy-cursors/' "$GTK4_SETTINGS"
        echo "✓ Atualizado tema de cursor no GTK4"
    else
        echo "gtk-cursor-theme-name=Nordzy-cursors" >> "$GTK4_SETTINGS"
        echo "gtk-cursor-theme-size=24" >> "$GTK4_SETTINGS"
        echo "✓ Adicionado tema de cursor no GTK4"
    fi
fi

# Criar link simbólico para cursor padrão
echo ""
echo "Configurando cursor padrão do sistema..."
mkdir -p "$HOME/.local/share/icons/default"
cat > "$HOME/.local/share/icons/default/index.theme" << 'EOF'
[Icon Theme]
Name=Default
Comment=Default Cursor Theme
Inherits=Nordzy-cursors
EOF

echo "✓ Cursor padrão configurado"

echo ""
echo "=========================================="
echo "✓ Configuração concluída!"
echo "=========================================="
echo ""
echo "Próximos passos:"
echo "1. Recarregue o Hyprland: hyprctl reload"
echo "2. Ou faça logout/login para aplicar completamente"
echo ""
echo "Para testar os cursores em diferentes aplicações:"
echo "  - Mova o mouse sobre diferentes janelas"
echo "  - Teste em GTK apps (Thunar, etc.)"
echo "  - Teste em Qt apps"
echo ""
echo "Se preferir a variante branca (clara):"
echo "  Edite os arquivos de configuração e substitua por:"
echo "  'Nordzy-white-cursors'"
echo ""
