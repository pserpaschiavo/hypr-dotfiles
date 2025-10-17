# 🎨 Proposta de Organização - Menus e Temas

## 📋 Análise dos Recursos Disponíveis

### Temas de Rofi Disponíveis:
- ✅ **Launchers**: 7 tipos (type-1 a type-7)
- ✅ **Power Menus**: 6 tipos (type-1 a type-6)
- ✅ **Applets**: 5 tipos (type-1 a type-5)

### Applets/Scripts Existentes:
- `apps.sh` - Launcher de aplicações
- `appasroot.sh` - Executar apps como root
- `battery.sh` - Informações de bateria
- `brightness.sh` - Controle de brilho
- `mpd.sh` - Controle de música
- `powermenu.sh` - Menu de energia
- `quicklinks.sh` - Links rápidos
- `screenshot.sh` - Screenshots
- `volume.sh` - Controle de volume

---

## 🎯 Sugestão de Agrupamento por Contexto

### 1️⃣ **SISTEMA** (System Management)
**Tema sugerido**: Launcher Type-1 ou Type-2 (mais formal/profissional)

**Aplicações incluídas**:
- 🔧 Configurações do Sistema (nwg-look, qt6ct)
- 📊 Monitor de Sistema (htop via Ghostty)
- 🗂️ Gerenciador de Arquivos (Thunar)
- 🔐 Gerenciador de Senhas (KeePassXC)
- 🗄️ Gerenciador de Pacotes (via Ghostty)
- ⚙️ Power Menu (desligar, reiniciar, etc.)

**Comando Ghostty para apps CLI**:
```bash
ghostty -e htop
ghostty -e yay
```

---

### 2️⃣ **REDE & CONEXÕES** (Network & Connectivity)
**Tema sugerido**: Applet Type-3 ou Type-4 (compacto e funcional)

**Aplicações incluídas**:
- 📡 Wi-Fi Manager (nmtui via Ghostty)
- 🔵 Bluetooth Manager (bluetui via Ghostty)
- 🌐 Navegadores (Firefox, Chromium)
- 🔒 VPN Manager
- 📥 Gerenciador de Downloads

**Script customizado**: `network-menu.sh`

---

### 3️⃣ **MÍDIA & CRIATIVIDADE** (Media & Creative)
**Tema sugerido**: Launcher Type-5 ou Type-6 (visual colorido)

**Aplicações incluídas**:
- 🎵 Spotify / Music Player
- 🎬 VLC / MPV
- 🎨 GIMP
- ✏️ Inkscape
- 📸 Visualizador de Imagens
- 🎤 Controle de Áudio (pavucontrol)

**Applet existente**: `mpd.sh`, `volume.sh`

---

### 4️⃣ **DESENVOLVIMENTO** (Development)
**Tema sugerido**: Launcher Type-2 ou Type-3 (minimalista)

**Aplicações incluídas**:
- 💻 VS Code / Editor
- 🖥️ Terminal (Ghostty)
- 🐙 Git GUI / Lazygit (via Ghostty)
- 🐳 Docker Desktop
- 📝 Markdown Editor
- 🗃️ Database Tools

**Comando Ghostty para ferramentas dev**:
```bash
ghostty -e lazygit
ghostty -e nvim
```

---

### 5️⃣ **COMUNICAÇÃO** (Communication)
**Tema sugerido**: Applet Type-1 ou Type-2

**Aplicações incluídas**:
- 💬 Discord
- ✈️ Telegram
- 📧 Email Client
- 📞 Zoom / Meet
- 💼 Slack

---

### 6️⃣ **UTILITÁRIOS** (Utilities & Tools)
**Tema sugerido**: Applet Type-5 (grid layout)

**Aplicações incluídas**:
- 📸 Screenshot Tool
- 🎨 Color Picker
- 📋 Clipboard Manager
- 🔆 Brightness Control
- 🔊 Volume Control
- 🔋 Battery Info
- 📅 Calendário
- 🧮 Calculadora

**Applets existentes**: `screenshot.sh`, `brightness.sh`, `volume.sh`, `battery.sh`

---

## 🖱️ Sugestões de Temas de Cursor

### Opção 1: **Catppuccin Cursors** (Recomendado)
```bash
yay -S catppuccin-cursors-mocha
```
**Características**: 
- 🎨 Múltiplas variantes de cores
- ✨ Design moderno e suave
- 🌙 Perfeito para tema escuro
- 📏 Múltiplos tamanhos (24, 32, 48, 64)

### Opção 2: **Bibata Modern**
```bash
sudo pacman -S bibata-cursor-theme
```
**Características**:
- 🎯 Design minimalista e profissional
- 🌓 Versões clara e escura
- ⚡ Muito popular na comunidade Linux

### Opção 3: **Nordzy Cursors**
```bash
yay -S nordzy-cursors
```
**Características**:
- 🎨 Baseado na paleta Nord
- 🖱️ Design clean e elegante
- 💎 Ótimo para temas minimalistas

### Opção 4: **Phinger Cursors**
```bash
yay -S phinger-cursors
```
**Características**:
- 🎨 Múltiplas cores vibrantes
- ✨ Animações suaves
- 🌈 Visual moderno e colorido

### Opção 5: **Volantes Cursors**
```bash
yay -S volantes-cursors
```
**Características**:
- 🎯 Cursores grandes e visíveis
- ♿ Ótimo para acessibilidade
- 🔍 Fácil de localizar na tela

---

## 🎨 Minha Recomendação de Cursor

**Top 1**: **Catppuccin Cursors Mocha** 
- Combina perfeitamente com o tema do Ghostty
- Consistente com esquema de cores moderno
- Variantes: Mocha, Frappe, Macchiato, Latte

**Configuração**:
```bash
# Instalar
yay -S catppuccin-cursors-mocha

# Configurar no Hyprland (já está no seu hyprland.conf)
env = XCURSOR_THEME,catppuccin-mocha-blue-cursor
env = XCURSOR_SIZE,24
```

---

## 📝 Proposta de Estrutura de Menus no Waybar

### Sugestão de Módulos Customizados (SEM tocar no workspaces):

**Barra Superior** (`topbar`):
```
[Launcher] [Workspaces] ............... [Clock] ............... [Sistema] [Power]
```

**Barra Inferior** (`bottombar`):
```
[Mídia] ............... [Tray] ............... [BT] [Audio] [Mic] [Rede] [Bateria]
```

### Módulos Propostos:

1. **custom/launcher** - Launcher de apps (System menu)
2. **custom/system** - Menu de sistema (settings, monitors, etc.)
3. **custom/media** - Controle de mídia
4. **custom/network** - Menu de rede
5. **custom/power** - Power menu
6. **tray** - System tray

---

## 🚀 Plano de Implementação

### Fase 1: Configurar Cursores ✓
- Instalar tema de cursor escolhido
- Configurar no Hyprland e GTK

### Fase 2: Criar Scripts de Menu
- Script para cada agrupamento de contexto
- Usar temas existentes do Rofi
- Integrar com Ghostty para apps CLI

### Fase 3: Módulos Waybar
- Criar módulos customizados
- Integrar com scripts
- Manter workspaces intocado

### Fase 4: Integração Ghostty
- Criar wrappers para apps CLI
- Configurar regras de janela
- Atalhos de teclado

---

## ❓ Perguntas para Você:

1. **Cursor**: Qual tema de cursor prefere? (Catppuccin, Bibata, Nordzy, outro?)

2. **Organização de Menus**: Gosta da divisão proposta (Sistema, Rede, Mídia, Dev, Comunicação, Utilitários)?

3. **Temas do Rofi**: Prefere manter um tema consistente ou variar por contexto?

4. **Waybar**: Aprova a sugestão de módulos? Algum módulo específico que gostaria?

5. **Aplicações CLI**: Quais apps CLI você usa mais? (htop, nvim, lazygit, etc.)

6. **Prioridade**: Por onde começamos?
   - a) Cursores
   - b) Scripts de menu com Rofi
   - c) Módulos do Waybar
   - d) Integração Ghostty

---

**Aguardando suas preferências para prosseguir!** 🎯
