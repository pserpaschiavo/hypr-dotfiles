# 🚀 WORKPLAN - Ambiente Hyprland

> **Sistema Operacional**: Arch Linux  
> **Compositor**: Hyprland  
> **Objetivo**: Criar um ambiente de desktop bonito, funcional e acessível

---

## 📊 Status Geral do Projeto

| Categoria | Progresso | Prioridade |
|-----------|-----------|------------|
| Sistema Base | � 85% | 🔴 Alta |
| Aparência Visual | 🟡 40% | 🟡 Média |
| Automação | � 30% | 🟡 Média |
| Acessibilidade | 🔴 10% | 🟢 Baixa |
| Qualidade de Vida | � 40% | 🟡 Média |

**Legenda**: 🟢 Completo | 🟡 Em Progresso | 🔴 Não Iniciado | ⚪ Opcional

---

## 🎯 FASE 1: SISTEMA BASE

### 1.1 Compositor Wayland
**Status**: � Completo (95%)

#### Dependências Principais
```bash
sudo pacman -S hyprland hyprpaper hyprlock hypridle
```

#### Configurações
- [x] `hyprland.conf` criado
- [x] Monitores configurados (eDP-1)
- [x] Gaps e bordas definidos
- [x] Animações configuradas
- [x] Regras de janela para aplicativos comuns
- [x] Atalhos de teclado completos
- [x] Workspaces configurados
- [x] Gestos de touchpad
- [x] Variáveis de ambiente Wayland
- [x] Autostart configurado

#### Arquivos
- `/home/phil/Dotfiles/hypr/.config/hypr/hyprland.conf`
- `/home/phil/Dotfiles/hypr/.config/hypr/scripts/`

---

### 1.2 Terminal Emulator
**Status**: � Completo (100%)

#### Dependências
```bash
sudo pacman -S ghostty
# OU yay -S ghostty-git (se não estiver no repositório oficial)
```

#### Configurações
- [x] Terminal definido como Ghostty
- [x] Nerd Font instalada e configurada (JetBrainsMono Nerd Font)
- [x] Esquema de cores definido (Catppuccin Mocha)
- [x] Transparência e blur configurados
- [x] Atalhos de teclado (Ctrl+Shift+C/V, etc.)
- [x] Padding e aparência configurados

#### Fontes Recomendadas
```bash
sudo pacman -S ttf-jetbrains-mono-nerd ttf-firacode-nerd ttf-hack-nerd
```

#### Arquivos
- `/home/phil/Dotfiles/ghostty/.config/ghostty/config` ✓ criado

---

### 1.3 Display Manager
**Status**: � Pronto para Configurar (80%)

#### Dependências
```bash
sudo pacman -S sddm qt6-svg qt6-declarative
yay -S sddm-sugar-candy-git
```

#### Configurações
- [x] SDDM instalado ✓
- [x] Script de configuração criado (`scripts/setup-sddm.sh`)
- [ ] Tema Sugar Candy aplicado (executar script)
- [ ] Wallpaper personalizado
- [ ] Configuração de autologin (opcional)
- [ ] Serviço habilitado (executar script)

#### Arquivos
- `/etc/sddm.conf.d/theme.conf` (será criado pelo script)
- `/usr/share/sddm/themes/sugar-candy/theme.conf` (será configurado pelo script)
- `/home/phil/Dotfiles/scripts/setup-sddm.sh` ✓ criado

#### Comandos
```bash
# Execute o script de configuração:
./scripts/setup-sddm.sh
```

---

## 🎨 FASE 2: APARÊNCIA E TEMAS

### 2.1 Barra de Status - Waybar
**Status**: 🟡 Em Progresso (60%)

#### Dependências
```bash
sudo pacman -S waybar otf-font-awesome ttf-font-awesome
```

#### Módulos Implementados
- [x] `hyprland/workspaces` - Workspaces dinâmicos
- [x] `pulseaudio#output` - Controle de volume de saída
- [x] `custom/microphone` - Controle de microfone
- [x] `clock` - Relógio
- [x] `clock#date` - Data completa
- [x] `network` - Status de rede
- [x] `battery` - Bateria (laptops)
- [x] `backlight` - Brilho da tela
- [x] `bluetooth` - Status Bluetooth

#### Módulos Pendentes
- [ ] `custom/launcher` - Launcher de aplicativos (Rofi)
- [ ] `custom/power` - Power menu (Rofi)
- [ ] `custom/weather` - Informações de clima
- [ ] `custom/updates` - Atualizações do sistema
- [ ] `mpris` - Controle de mídia
- [ ] `tray` - System tray
- [ ] `temperature` - Temperatura do sistema
- [ ] `cpu` - Uso de CPU
- [ ] `memory` - Uso de RAM

#### Temas CSS
- [x] `style.css` - Tema base
- [x] `[Dark]Half-Moon.css`
- [x] `[Dark]GoldenNoir.css`
- [x] `[Colored]Translucent.css`
- [ ] Sistema de troca de temas
- [ ] Integração com Wallust

#### Arquivos
- `/home/phil/Dotfiles/waybar/.config/waybar/config`
- `/home/phil/Dotfiles/waybar/.config/waybar/Modules`
- `/home/phil/Dotfiles/waybar/.config/waybar/style.css`
- `/home/phil/Dotfiles/waybar/.config/waybar/style/*.css`

---

### 2.2 Sistema de Temas Dinâmicos
**Status**: 🔴 Não Iniciado (0%)

#### Dependências
```bash
yay -S wallust
sudo pacman -S imagemagick
```

#### Funcionalidades
- [ ] Wallust instalado e configurado
- [ ] Templates para cada aplicativo
- [ ] Geração automática de paletas
- [ ] Script de mudança de wallpaper
- [ ] Integração com Hyprpaper
- [ ] Reload automático de componentes

#### Templates Necessários
- [ ] Waybar (`~/.config/wallust/templates/waybar.css`)
- [ ] Rofi (`~/.config/wallust/templates/rofi.rasi`)
- [ ] Dunst (`~/.config/wallust/templates/dunstrc`)
- [ ] Ghostty (`~/.config/wallust/templates/ghostty.conf`)
- [ ] Hyprland (`~/.config/wallust/templates/colors.conf`)

#### Arquivos
- `/home/phil/Dotfiles/wallust/.config/wallust/wallust.toml` (criar)
- `/home/phil/Dotfiles/scripts/set-theme.sh` (criar)

---

### 2.3 Wallpaper Manager
**Status**: 🟡 Em Progresso (40%)

#### Dependências
```bash
sudo pacman -S hyprpaper
```

#### Configurações
- [x] Hyprpaper instalado
- [ ] Wallpaper padrão definido
- [ ] Múltiplos monitores suportados
- [ ] Integração com script de temas
- [ ] Autostart configurado

#### Arquivos
- `/home/phil/Dotfiles/hyprpaper/.config/hypr/hyprpaper.conf`
- `/home/phil/Dotfiles/wallpapers/` (criar diretório)

---

### 2.4 Temas GTK e Qt
**Status**: 🔴 Não Iniciado (0%)

#### Dependências
```bash
sudo pacman -S nwg-look gtk-engine-murrine
sudo pacman -S kvantum qt6ct qt5ct
sudo pacman -S papirus-icon-theme
```

#### Temas Recomendados
```bash
yay -S nordic-theme
yay -S catppuccin-gtk-theme-mocha
```

#### Configurações
- [ ] Tema GTK instalado
- [ ] Tema de ícones instalado
- [ ] Tema de cursor instalado
- [ ] Kvantum configurado para Qt
- [ ] Consistência visual entre GTK e Qt

#### Arquivos
- `~/.config/gtk-3.0/settings.ini`
- `~/.config/gtk-4.0/settings.ini`
- `~/.config/Kvantum/kvantum.kvconfig`
- `~/.config/qt6ct/qt6ct.conf`

---

## 🚀 FASE 3: LAUNCHER E MENUS

### 3.1 Application Launcher - Rofi
**Status**: 🔴 Não Iniciado (0%)

#### Dependências
```bash
sudo pacman -S rofi-wayland
yay -S rofi-emoji rofi-calc
```

#### Temas e Scripts
```bash
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
```

#### Funcionalidades
- [ ] Launcher de aplicativos
- [ ] Power menu (shutdown, reboot, lock, logout)
- [ ] Screenshot menu
- [ ] Wi-Fi selector
- [ ] Bluetooth manager
- [ ] Clipboard manager
- [ ] Emoji picker
- [ ] Calculadora
- [ ] Tema personalizado

#### Arquivos
- `/home/phil/Dotfiles/rofi/.config/rofi/config.rasi` (criar)
- `/home/phil/Dotfiles/rofi/.config/rofi/launchers/` (criar)
- `/home/phil/Dotfiles/rofi/.config/rofi/powermenu/` (criar)

---

### 3.2 Scripts de Automação
**Status**: 🔴 Não Iniciado (0%)

#### Scripts Necessários

##### 📸 Screenshot Manager
```bash
sudo pacman -S grim slurp wl-clipboard swappy
```
- [ ] `screenshot.sh` - Menu de screenshots
  - Área selecionada
  - Janela ativa
  - Tela cheia
  - Monitor específico
  - Salvar em arquivo
  - Copiar para clipboard
  - Editar com Swappy

##### 🌐 Network Manager
```bash
sudo pacman -S networkmanager nm-connection-editor
```
- [ ] `wifi-menu.sh` - Gerenciador de Wi-Fi via Rofi
- [ ] `vpn-menu.sh` - Gerenciador de VPN

##### 🎵 Media Controller
```bash
sudo pacman -S playerctl
```
- [ ] `media-control.sh` - Controle de mídia universal

##### 🔆 Brightness & Volume
- [ ] `brightness.sh` - Controle de brilho
- [ ] `volume.sh` - Controle de volume com notificações

##### 📋 Clipboard Manager
```bash
sudo pacman -S cliphist
```
- [ ] `clipboard-menu.sh` - Histórico de clipboard

#### Diretório
- `/home/phil/Dotfiles/scripts/` (criar)

---

## 🔔 FASE 4: NOTIFICAÇÕES

### 4.1 Notification Daemon - Dunst
**Status**: 🔴 Não Iniciado (0%)

#### Dependências
```bash
sudo pacman -S dunst libnotify
```

#### Configurações
- [ ] Dunst instalado
- [ ] Posição e aparência configuradas
- [ ] Ícones habilitados
- [ ] Regras de urgência definidas
- [ ] Atalhos de teclado (close, history)
- [ ] Integração com tema do sistema
- [ ] Sons de notificação (opcional)

#### Recursos
- [ ] Notificações de volume
- [ ] Notificações de brilho
- [ ] Notificações de bateria
- [ ] Notificações de rede
- [ ] Notificações de aplicativos

#### Arquivos
- `/home/phil/Dotfiles/dunst/.config/dunst/dunstrc` (criar)

---

## 🔒 FASE 5: SEGURANÇA E SESSÃO

### 5.1 Screen Locker
**Status**: 🔴 Não Iniciado (0%)

#### Dependências
```bash
sudo pacman -S hyprlock
# OU
sudo pacman -S swaylock-effects
```

#### Configurações
- [ ] Locker instalado
- [ ] Wallpaper de lock screen
- [ ] Informações de usuário
- [ ] Relógio e data
- [ ] Indicador de tentativas
- [ ] Atalho de teclado (SUPER+L)

#### Arquivos
- `/home/phil/Dotfiles/hypr/.config/hypr/hyprlock.conf` (criar)

---

### 5.2 Idle Manager
**Status**: 🔴 Não Iniciado (0%)

#### Dependências
```bash
sudo pacman -S hypridle
```

#### Configurações
- [ ] Auto-lock após inatividade
- [ ] Desligar tela após tempo definido
- [ ] Modo não perturbe
- [ ] Integração com media players

#### Arquivos
- `/home/phil/Dotfiles/hypr/.config/hypr/hypridle.conf` (criar)

---

## 🎮 FASE 6: INTEGRAÇÃO DE HARDWARE

### 6.1 Áudio
**Status**: 🟡 Em Progresso (50%)

#### Dependências
```bash
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack
sudo pacman -S wireplumber pavucontrol
```

#### Configurações
- [x] PipeWire instalado
- [x] Módulo Waybar de áudio
- [ ] Controle de volume por teclado
- [ ] Notificações de volume
- [ ] Perfis de áudio
- [ ] Bluetooth audio

---

### 6.2 Bluetooth
**Status**: 🟡 Em Progresso (40%)

#### Dependências
```bash
sudo pacman -S bluez bluez-utils blueman
yay -S bluetui
```

#### Configurações
- [x] Bluetooth habilitado
- [x] Módulo Waybar de Bluetooth
- [ ] Auto-connect de dispositivos conhecidos
- [ ] Controle via Rofi

#### Comandos
```bash
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```

---

### 6.3 Teclas de Mídia
**Status**: 🔴 Não Iniciado (0%)

#### Dependências
```bash
sudo pacman -S playerctl
```

#### Atalhos no Hyprland
- [ ] Play/Pause
- [ ] Next/Previous
- [ ] Volume Up/Down/Mute
- [ ] Brightness Up/Down

---

### 6.4 Bateria e Energia
**Status**: 🟡 Em Progresso (30%)

#### Dependências
```bash
sudo pacman -S acpi tlp
```

#### Configurações
- [x] Módulo de bateria no Waybar
- [ ] Notificações de bateria baixa
- [ ] Perfis de energia
- [ ] Auto-suspensão

---

## 🛠️ FASE 7: FERRAMENTAS E UTILITÁRIOS

### 7.1 File Manager
**Status**: 🔴 Não Iniciado (0%)

#### Opções
```bash
# GUI
sudo pacman -S thunar thunar-archive-plugin thunar-media-tags-plugin
sudo pacman -S nemo

# TUI
sudo pacman -S ranger lf yazi
```

#### Configurações
- [ ] File manager instalado
- [ ] Thumbnails habilitados
- [ ] Integração com archive manager
- [ ] Atalho de teclado

---

### 7.2 Screenshot Tools
**Status**: 🔴 Não Iniciado (0%)

#### Dependências
```bash
sudo pacman -S grim slurp swappy wl-clipboard
sudo pacman -S imagemagick
```

#### Funcionalidades
- [ ] Captura de área
- [ ] Captura de janela
- [ ] Captura de tela cheia
- [ ] Editor de screenshots
- [ ] Upload automático (opcional)

---

### 7.3 Clipboard Manager
**Status**: 🔴 Não Iniciado (0%)

#### Dependências
```bash
sudo pacman -S cliphist wl-clipboard
```

#### Configurações
- [ ] Daemon iniciado automaticamente
- [ ] Histórico persistente
- [ ] Busca via Rofi
- [ ] Atalho de teclado

---

### 7.4 Color Picker
**Status**: 🔴 Não Iniciado (0%)

#### Dependências
```bash
sudo pacman -S hyprpicker
```

#### Configurações
- [ ] Atalho de teclado
- [ ] Copiar para clipboard
- [ ] Notificação com cor selecionada

---

## 📦 FASE 8: APLICAÇÕES ESSENCIAIS

### 8.1 Web Browser
```bash
sudo pacman -S firefox chromium
```

### 8.2 Editor de Texto
```bash
sudo pacman -S neovim code
```

### 8.3 Gerenciador de Senhas
```bash
sudo pacman -S keepassxc
```

### 8.4 Comunicação
```bash
sudo pacman -S discord telegram-desktop
```

### 8.5 Multimídia
```bash
sudo pacman -S vlc spotify-launcher
sudo pacman -S gimp inkscape
```

---

## ♿ FASE 9: ACESSIBILIDADE

### 9.1 Configurações de Acessibilidade
**Status**: 🔴 Não Iniciado (0%)

#### Recursos
- [ ] Alto contraste
- [ ] Tamanhos de fonte aumentados
- [ ] Navegação por teclado completa
- [ ] Indicadores visuais de foco
- [ ] Notificações sonoras (opcional)
- [ ] Screen reader (Orca)

---

## 📚 FASE 10: DOCUMENTAÇÃO

### 10.1 Arquivos de Documentação
- [x] `WORKPLAN.md` - Este arquivo
- [x] `ROADMAP.md` - Roadmap original
- [ ] `README.md` - Documentação geral
- [ ] `INSTALL.md` - Guia de instalação
- [ ] `KEYBINDINGS.md` - Lista de atalhos
- [ ] `TROUBLESHOOTING.md` - Solução de problemas
- [ ] `CUSTOMIZATION.md` - Guia de customização

### 10.2 Screenshots e Demos
- [ ] Criar diretório `screenshots/`
- [ ] Screenshots do desktop
- [ ] Screenshots dos menus
- [ ] GIFs de demonstração
- [ ] Vídeo tutorial (opcional)

---

## 🔧 MANUTENÇÃO E ATUALIZAÇÕES

### Comandos Úteis

#### Atualizar Sistema
```bash
sudo pacman -Syu
yay -Syu
```

#### Limpar Cache
```bash
sudo pacman -Sc
yay -Sc
paccache -r
```

#### Verificar Arquivos Órfãos
```bash
pacman -Qtdq | sudo pacman -Rns -
```

#### Reload Hyprland
```bash
hyprctl reload
```

#### Restart Waybar
```bash
killall waybar && waybar &
```

#### Restart Dunst
```bash
killall dunst && dunst &
```

---

## 📝 NOTAS E OBSERVAÇÕES

### Dependências Gerais do Sistema
```bash
# Base Devel
sudo pacman -S base-devel git

# AUR Helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Wayland Essentials
sudo pacman -S wayland wayland-protocols
sudo pacman -S xdg-desktop-portal-hyprland

# Polkit
sudo pacman -S polkit-kde-agent

# Fonts
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts noto-fonts-emoji
sudo pacman -S ttf-jetbrains-mono-nerd ttf-firacode-nerd
```

### Variáveis de Ambiente
Adicionar ao `~/.config/hypr/hyprland.conf`:
```bash
env = XDG_CURRENT_DESKTOP,Hyprland
env = XDG_SESSION_TYPE,wayland
env = XDG_SESSION_DESKTOP,Hyprland
env = QT_QPA_PLATFORM,wayland
env = QT_QPA_PLATFORMTHEME,qt6ct
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
env = GDK_BACKEND,wayland
env = MOZ_ENABLE_WAYLAND,1
```

### Performance
```bash
# GPU Drivers
sudo pacman -S mesa vulkan-icd-loader
# Para Intel
sudo pacman -S vulkan-intel
# Para AMD
sudo pacman -S vulkan-radeon
# Para NVIDIA
sudo pacman -S nvidia nvidia-utils
```

---

## 🎯 PRÓXIMOS PASSOS IMEDIATOS

### Prioridade Alta 🔴
1. [ ] Configurar SDDM como display manager
2. [ ] Completar configuração do Waybar (módulos faltantes)
3. [ ] Instalar e configurar Rofi (launcher + power menu)
4. [ ] Configurar Dunst para notificações
5. [ ] Criar script de screenshots

### Prioridade Média 🟡
1. [ ] Implementar sistema de temas com Wallust
2. [ ] Configurar Hyprlock/Swaylock
3. [ ] Adicionar controles de mídia
4. [ ] Configurar clipboard manager
5. [ ] Instalar e configurar temas GTK/Qt

### Prioridade Baixa 🟢
1. [ ] Documentação completa
2. [ ] Screenshots e demos
3. [ ] Recursos de acessibilidade avançados
4. [ ] Otimizações de performance

---

## 📞 RECURSOS E LINKS ÚTEIS

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Waybar Wiki](https://github.com/Alexays/Waybar/wiki)
- [Rofi Themes](https://github.com/adi1090x/rofi)
- [Arch Wiki - Hyprland](https://wiki.archlinux.org/title/Hyprland)
- [r/hyprland](https://www.reddit.com/r/hyprland/)
- [Hyprland Discord](https://discord.gg/hQ9XvMUjjr)

---

**Última Atualização**: 16 de Outubro de 2025  
**Versão**: 1.0  
**Autor**: Phil  
**Sistema**: Arch Linux + Hyprland
