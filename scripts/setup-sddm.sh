#!/usr/bin/env bash

## Script de Configuração do SDDM
## Requer: sudo, SDDM instalado

echo "=========================================="
echo "   Configuração do SDDM"
echo "=========================================="
echo ""

# Verificar se está rodando como root
if [ "$EUID" -eq 0 ]; then
    echo "Não execute este script como root!"
    echo "O script pedirá sudo quando necessário."
    exit 1
fi

# Verificar se SDDM está instalado
if ! pacman -Qi sddm &> /dev/null; then
    echo "SDDM não está instalado!"
    echo "Execute: sudo pacman -S sddm"
    exit 1
fi

# Verificar se o tema Sugar Candy está instalado
if ! yay -Qi sddm-sugar-candy-git &> /dev/null; then
    echo "Tema Sugar Candy não está instalado."
    read -p "Deseja instalar? (s/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        yay -S sddm-sugar-candy-git
    else
        echo "Continuando sem o tema..."
    fi
fi

# Criar diretório de configuração se não existir
sudo mkdir -p /etc/sddm.conf.d

# Criar arquivo de configuração
echo "Criando arquivo de configuração..."

sudo tee /etc/sddm.conf.d/theme.conf > /dev/null << 'EOF'
[Theme]
Current=sugar-candy
CursorTheme=Adwaita

[General]
InputMethod=

[Users]
MaximumUid=60000
MinimumUid=1000
HideUsers=
HideShells=
RememberLastUser=true
RememberLastSession=true

[X11]
ServerArguments=-nolisten tcp

[Wayland]
SessionDir=/usr/share/wayland-sessions
CompositorCommand=Hyprland
EOF

echo "✓ Arquivo de configuração criado"

# Configurar tema Sugar Candy se estiver instalado
if [ -d "/usr/share/sddm/themes/sugar-candy" ]; then
    echo ""
    echo "Configurando tema Sugar Candy..."
    
    # Criar configuração personalizada do tema
    sudo tee /usr/share/sddm/themes/sugar-candy/theme.conf.user > /dev/null << 'EOF'
[General]
Background="Backgrounds/Mountain.jpg"
DimBackgroundImage="0.0"
ScaleImageCropped="true"
ScreenWidth="1920"
ScreenHeight="1080"

Font="JetBrainsMono Nerd Font"
FontSize=""

MainColor="#e0e0e0"
AccentColor="#89b4fa"
BackgroundColor="#1e1e2e"

OverrideLoginButtonTextColor=""
LoginButtonTextColor="#ffffff"

RoundCorners="20"
LoginButtonTextSize=""

Locale=""
HourFormat="HH:mm"
DateFormat="dddd, d MMMM yyyy"

HeaderText="Bem-vindo!"

ForceRightToLeft="false"
ForceLastUser="true"
ForcePasswordFocus="true"
ForceHideCompletePassword="false"
ForceHideVirtualKeyboardButton="false"
ForceHideSystemButtons="false"

AllowEmptyPassword="false"
AllowBadUsernames="false"

Locale=""
HourFormat="HH:mm"
DateFormat="dddd, d MMMM yyyy"

TranslateUsernamePlaceholder=""
TranslatePasswordPlaceholder=""
TranslateShowPassword=""
TranslateLogin=""
TranslateLoginFailedWarning=""
TranslateCapslockWarning=""
TranslateSession=""
TranslateSuspend=""
TranslateHibernate=""
TranslateReboot=""
TranslateShutdown=""
TranslateVirtualKeyboardButton=""
EOF

    echo "✓ Tema Sugar Candy configurado"
fi

echo ""
echo "Habilitando serviço SDDM..."
sudo systemctl enable sddm.service

echo ""
echo "=========================================="
echo "✓ Configuração concluída!"
echo "=========================================="
echo ""
echo "Próximos passos:"
echo "1. Adicione um wallpaper personalizado em: /usr/share/sddm/themes/sugar-candy/Backgrounds/"
echo "2. Reinicie o sistema: reboot"
echo "3. SDDM será iniciado automaticamente no boot"
echo ""
echo "Para desabilitar SDDM (se necessário):"
echo "  sudo systemctl disable sddm.service"
echo ""
