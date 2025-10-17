# 🖥️ Guia de Aplicações CLI - Workflow Focado em Teclado

> **Objetivo**: Construir um ambiente produtivo totalmente controlável via teclado, com aplicações CLI modernas e eficientes.

---

## 📚 Índice por Categoria

1. [File Managers](#file-managers)
2. [Music Players](#music-players)
3. [System Monitors](#system-monitors)
4. [Text Editors](#text-editors)
5. [Git & Development](#git--development)
6. [Network Tools](#network-tools)
7. [Productivity](#productivity)
8. [Media & Images](#media--images)
9. [Utilities](#utilities)

---

## 📁 File Managers

### 1. **Yazi** ⭐ RECOMENDADO
**Descrição**: File manager moderno e rápido escrito em Rust, com preview de arquivos.

```bash
# Instalação
sudo pacman -S yazi ffmpegthumbnailer imagemagick poppler fd ripgrep fzf zoxide

# Uso
yazi

# Abrir no Ghostty
ghostty -e yazi
```

**Features**:
- 🖼️ Preview de imagens, vídeos, PDFs
- ⚡ Extremamente rápido
- 🎨 Customizável
- 📦 Suporte a plugins
- 🔍 Busca integrada com FZF

**Atalhos principais**:
- `j/k` - Navegar para baixo/cima
- `h/l` - Voltar/Entrar em diretório
- `Space` - Selecionar arquivo
- `y` - Copiar
- `d` - Recortar
- `p` - Colar
- `/` - Buscar
- `q` - Sair

---

### 2. **Ranger**
**Descrição**: File manager clássico com preview e vi-like keybindings.

```bash
# Instalação
sudo pacman -S ranger

# Uso
ranger
```

**Features**:
- 🎯 Atalhos estilo Vim
- 🖼️ Preview de múltiplos tipos de arquivo
- 🔧 Altamente configurável

---

### 3. **lf (list files)**
**Descrição**: File manager minimalista e rápido inspirado no ranger.

```bash
# Instalação
sudo pacman -S lf

# Uso
lf
```

**Features**:
- ⚡ Muito leve e rápido
- 🎯 Atalhos simples
- 📝 Configuração em linguagem própria

---

## 🎵 Music Players

### 1. **Spotify TUI** ⭐ RECOMENDADO
**Descrição**: Interface TUI para Spotify com controle completo.

```bash
# Instalação
yay -S spotify-tui spotify

# Configuração
spotifyd  # daemon
spt      # TUI

# Uso no Ghostty
ghostty -e spt
```

**Features**:
- 🎵 Controle completo do Spotify
- 📱 Busca, playlists, queue
- ⌨️ Atalhos de teclado intuitivos
- 🎨 Interface bonita e customizável

**Atalhos principais**:
- `/` - Buscar
- `Space` - Play/Pause
- `>` / `<` - Próxima/Anterior
- `+` / `-` - Volume
- `s` - Shuffle
- `r` - Repeat

---

### 2. **ncmpcpp** + **MPD**
**Descrição**: Player de música local poderoso com visualizador.

```bash
# Instalação
sudo pacman -S mpd ncmpcpp

# Configuração inicial
mkdir -p ~/.config/mpd
mkdir -p ~/.config/ncmpcpp
```

**Features**:
- 🎼 Biblioteca de música local
- 📊 Visualizador de espectro
- 🎨 Altamente customizável
- 📝 Edição de tags

---

### 3. **cmus**
**Descrição**: Player de música minimalista e eficiente.

```bash
# Instalação
sudo pacman -S cmus

# Uso
cmus
```

**Features**:
- ⚡ Muito leve
- 🎯 Interface simples
- 📁 Suporte a múltiplos formatos

---

## 📊 System Monitors

### 1. **btop** ⭐ RECOMENDADO
**Descrição**: Monitor de sistema moderno e bonito.

```bash
# Instalação
sudo pacman -S btop

# Uso
btop

# Ghostty
ghostty -e btop
```

**Features**:
- 🎨 Interface gráfica linda
- 📊 CPU, RAM, Disco, Rede
- 🖱️ Suporte a mouse (opcional)
- ⚡ Baixo uso de recursos

**Atalhos**:
- `q` - Sair
- `m` - Menu
- `+/-` - Zoom
- `f` - Filtrar processos

---

### 2. **htop**
**Descrição**: Monitor de processos clássico e confiável.

```bash
# Instalação
sudo pacman -S htop

# Uso
htop
```

---

### 3. **bottom (btm)**
**Descrição**: Monitor de sistema alternativo ao htop.

```bash
# Instalação
sudo pacman -S bottom

# Uso
btm
```

---

## ✏️ Text Editors

### 1. **Neovim** ⭐ RECOMENDADO
**Descrição**: Editor de texto moderno, fork do Vim com melhorias.

```bash
# Instalação
sudo pacman -S neovim

# Com configuração moderna
yay -S lazyvim  # ou NvChad, AstroVim

# Uso
nvim arquivo.txt
```

**Features**:
- ⚡ Extremamente poderoso
- 🔌 Plugins modernos (LSP, TreeSitter)
- ⌨️ Eficiência máxima de teclado
- 🎨 Customizável

---

### 2. **Helix**
**Descrição**: Editor moderno pós-Vim com LSP integrado.

```bash
# Instalação
sudo pacman -S helix

# Uso
hx arquivo.txt
```

**Features**:
- 🚀 LSP e TreeSitter built-in
- 🎯 Seleção múltipla nativa
- 📦 Zero configuração necessária

---

## 🐙 Git & Development

### 1. **Lazygit** ⭐ RECOMENDADO
**Descrição**: Interface TUI linda para Git.

```bash
# Instalação
sudo pacman -S lazygit

# Uso
lazygit

# Ghostty
ghostty -e lazygit
```

**Features**:
- 🎨 Interface intuitiva
- 🔄 Staging, commits, branches visual
- ⚡ Muito mais rápido que comandos manuais
- 🌳 Visualização de branches

**Atalhos**:
- `Space` - Stage/Unstage
- `c` - Commit
- `P` - Push
- `p` - Pull
- `n` - Nova branch

---

### 2. **tig**
**Descrição**: Navegador de repositórios Git.

```bash
# Instalação
sudo pacman -S tig

# Uso
tig
```

---

### 3. **gh (GitHub CLI)**
**Descrição**: CLI oficial do GitHub.

```bash
# Instalação
sudo pacman -S github-cli

# Uso
gh pr list
gh issue create
```

---

## 🌐 Network Tools

### 1. **nmtui** ⭐ JÁ INSTALADO
**Descrição**: NetworkManager TUI para Wi-Fi.

```bash
# Uso no Ghostty
ghostty -e nmtui
```

---

### 2. **bluetui** ⭐ RECOMENDADO
**Descrição**: Interface TUI para Bluetooth.

```bash
# Instalação
yay -S bluetui

# Uso no Ghostty
ghostty -e bluetui
```

---

### 3. **gping**
**Descrição**: Ping com gráfico em tempo real.

```bash
# Instalação
sudo pacman -S gping

# Uso
gping google.com
```

---

### 4. **speedtest-cli**
**Descrição**: Teste de velocidade de internet.

```bash
# Instalação
sudo pacman -S speedtest-cli

# Uso
speedtest-cli
```

---

## 📝 Productivity

### 1. **taskwarrior** + **taskwarrior-tui**
**Descrição**: Gerenciador de tarefas poderoso.

```bash
# Instalação
sudo pacman -S task
yay -S taskwarrior-tui

# Uso
taskwarrior-tui
```

---

### 2. **calcurse**
**Descrição**: Calendário e agenda.

```bash
# Instalação
sudo pacman -S calcurse

# Uso
calcurse
```

---

### 3. **translate-shell**
**Descrição**: Tradutor no terminal (Google Translate).

```bash
# Instalação
yay -S translate-shell

# Uso
trans en:pt "Hello World"
```

---

## 🖼️ Media & Images

### 1. **chafa**
**Descrição**: Visualizador de imagens no terminal.

```bash
# Instalação
sudo pacman -S chafa

# Uso
chafa imagem.jpg
```

---

### 2. **mpv**
**Descrição**: Player de vídeo minimalista.

```bash
# Instalação
sudo pacman -S mpv

# Uso
mpv video.mp4
```

---

### 3. **cava**
**Descrição**: Visualizador de áudio (espectro).

```bash
# Instalação
sudo pacman -S cava

# Uso
cava
```

---

## 🛠️ Utilities

### 1. **fzf** ⭐ ESSENCIAL
**Descrição**: Fuzzy finder ultra-rápido.

```bash
# Instalação
sudo pacman -S fzf

# Uso
# Buscar arquivos
fd | fzf

# Buscar no histórico do shell
Ctrl+R
```

---

### 2. **ripgrep (rg)**
**Descrição**: Busca de texto ultra-rápida.

```bash
# Instalação
sudo pacman -S ripgrep

# Uso
rg "texto" ~/Documents
```

---

### 3. **bat**
**Descrição**: `cat` com syntax highlighting.

```bash
# Instalação
sudo pacman -S bat

# Uso
bat arquivo.py
```

---

### 4. **eza (exa)**
**Descrição**: `ls` moderno com cores e ícones.

```bash
# Instalação
sudo pacman -S eza

# Uso
eza --icons --tree --level=2
```

---

### 5. **zoxide**
**Descrição**: `cd` inteligente que aprende seus padrões.

```bash
# Instalação
sudo pacman -S zoxide

# Configuração no .zshrc
eval "$(zoxide init zsh)"

# Uso
z dotfiles  # pula direto para ~/Dotfiles
```

---

### 6. **dust**
**Descrição**: `du` mais intuitivo (uso de disco).

```bash
# Instalação
sudo pacman -S dust

# Uso
dust
```

---

### 7. **procs**
**Descrição**: `ps` moderno e colorido.

```bash
# Instalação
sudo pacman -S procs

# Uso
procs
```

---

## 📦 Pacote Completo Recomendado

```bash
# Core Essentials (Mais Importantes)
sudo pacman -S yazi btop neovim lazygit fzf ripgrep bat eza zoxide

# Music & Media
yay -S spotify-tui
sudo pacman -S mpv cava

# Network
yay -S bluetui
sudo pacman -S gping

# Utilities
sudo pacman -S dust procs chafa

# Development
sudo pacman -S github-cli tig

# Opcional mas útil
sudo pacman -S translate-shell calcurse
```

---

## 🎯 Configuração Recomendada no Hyprland

Adicione atalhos no `hyprland.conf`:

```bash
# File Manager
bind = $mainMod SHIFT, E, exec, ghostty -e yazi

# System Monitor
bind = $mainMod SHIFT, H, exec, ghostty -e btop

# Music Player
bind = $mainMod SHIFT, M, exec, ghostty -e spt

# Git Manager
bind = $mainMod SHIFT, G, exec, ghostty -e lazygit

# Network Manager
bind = $mainMod SHIFT, N, exec, ghostty -e nmtui

# Bluetooth Manager
bind = $mainMod SHIFT, B, exec, ghostty -e bluetui
```

---

## 💡 Dicas de Produtividade

### Criar Aliases no Zsh

Adicione ao `~/.zshrc`:

```bash
# File manager
alias fm='yazi'

# System monitor
alias mon='btop'

# Git
alias lg='lazygit'

# Better ls
alias ls='eza --icons'
alias ll='eza --icons -l'
alias la='eza --icons -la'

# Better cat
alias cat='bat'

# Smart cd
alias cd='z'
```

---

## 🚀 Próximos Passos

1. **Instalar pacote essencial**:
   ```bash
   sudo pacman -S yazi btop neovim lazygit fzf ripgrep bat eza zoxide
   ```

2. **Configurar atalhos no Hyprland**

3. **Testar cada aplicação**

4. **Customizar conforme preferência**

---

**Pronto para instalar?** Me avise quais aplicações deseja e crio os scripts! 🎯
