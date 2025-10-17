# ⌨️ Guia Completo de Atalhos de Teclado

> **Tecla Modificadora Principal**: `SUPER` (Windows/Command key)

---

## 🚀 Lançadores e Menus

### Aplicações
| Atalho | Ação |
|--------|------|
| `SUPER + R` | Rofi Application Launcher |
| `SUPER + T` | Terminal (Ghostty) |
| `SUPER + E` | File Manager (Thunar GUI) |
| `SUPER + B` | Navegador Web (Firefox) |

### Menus Contextuais
| Atalho | Menu |
|--------|------|
| `SUPER + SHIFT + S` | 🖥️  **Sistema** (monitor, settings, file manager) |
| `SUPER + SHIFT + N` | 📡 **Rede** (Wi-Fi, Bluetooth, speed test) |
| `SUPER + SHIFT + M` | 🎵 **Mídia** (Spotify, players, GIMP) |
| `SUPER + SHIFT + D` | 💻 **Desenvolvimento** (VS Code, Neovim, Git) |
| `SUPER + SHIFT + U` | 🛠️  **Utilitários** (screenshot, calculator, clipboard) |
| `SUPER + SHIFT + L` | ⏻ **Power Menu** (shutdown, reboot, logout) |

---

## 🖥️ Apps CLI Rápidos (Ghostty)

| Atalho | Aplicação |
|--------|-----------|
| `SUPER + ALT + F` | 📁 Yazi (File Manager TUI) |
| `SUPER + ALT + H` | 📊 btop (System Monitor) |
| `SUPER + ALT + M` | 🎵 Spotify TUI |
| `SUPER + ALT + G` | 🐙 Lazygit (Git TUI) |
| `SUPER + ALT + N` | 📡 nmtui (Network Manager) |
| `SUPER + ALT + B` | 🔵 bluetui (Bluetooth Manager) |

---

## 🪟 Gerenciamento de Janelas

### Básico
| Atalho | Ação |
|--------|------|
| `SUPER + Q` | Fechar janela ativa |
| `SUPER + V` | Toggle floating |
| `SUPER + F` | Fullscreen |
| `SUPER + M` | Maximizar (fullscreen mode 1) |
| `SUPER + S` | Pin window (manter no topo) |
| `SUPER + P` | Pseudotile (dwindle) |
| `SUPER + J` | Toggle split (dwindle) |

### Navegação
| Atalho | Ação |
|--------|------|
| `SUPER + ←↑↓→` | Mover foco entre janelas |
| `ALT + Tab` | Próxima janela (cycle) |

### Mover Janelas
| Atalho | Ação |
|--------|------|
| `SUPER + CTRL + ←↑↓→` | Mover janela (direções) |
| `SUPER + ALT + ←↑↓→` | Swap window (trocar posições) |

### Redimensionar
| Atalho | Ação |
|--------|------|
| `SUPER + SHIFT + ←→` | Redimensionar horizontal |
| `SUPER + SHIFT + ↑↓` | Redimensionar vertical |

### Grupos
| Atalho | Ação |
|--------|------|
| `SUPER + A` | Toggle group |
| `SUPER + Tab` | Próximo na group |
| `SUPER + SHIFT + Tab` | Anterior na group |

---

## 🗂️ Workspaces

### Navegar
| Atalho | Ação |
|--------|------|
| `SUPER + 1-9` | Ir para workspace 1-9 |
| `SUPER + 0` | Ir para workspace 10 |
| `SUPER + ,` | Workspace anterior |
| `SUPER + .` | Próximo workspace |
| `SUPER + Tab` | Workspace +1 |
| `SUPER + SHIFT + Tab` | Workspace -1 |

### Mover Janelas
| Atalho | Ação |
|--------|------|
| `SUPER + SHIFT + 1-9` | Mover janela para workspace 1-9 |
| `SUPER + SHIFT + 0` | Mover janela para workspace 10 |
| `SUPER + SHIFT + ,` | Mover para workspace anterior |
| `SUPER + SHIFT + .` | Mover para próximo workspace |

### Mover Silenciosamente
| Atalho | Ação |
|--------|------|
| `SUPER + CTRL + 1-9` | Mover sem seguir (silent) |
| `SUPER + CTRL + 0` | Mover para workspace 10 (silent) |
| `SUPER + CTRL + ,/.` | Mover +1/-1 (silent) |

---

## 📸 Screenshots

| Atalho | Ação |
|--------|------|
| `Print` | Tela cheia (copiar para clipboard) |
| `SHIFT + Print` | Área selecionada (copiar) |
| `CTRL + Print` | Tela cheia (salvar arquivo) |
| `CTRL + SHIFT + Print` | Área selecionada (salvar) |

📁 Arquivos salvos em: `~/Pictures/Screenshots/`

---

## 🎵 Controle de Mídia

### Playback
| Atalho | Ação |
|--------|------|
| `XF86AudioPlay` | Play/Pause |
| `XF86AudioNext` | Próxima faixa |
| `XF86AudioPrev` | Faixa anterior |

### Volume
| Atalho | Ação |
|--------|------|
| `XF86AudioRaiseVolume` | Volume + |
| `XF86AudioLowerVolume` | Volume - |
| `XF86AudioMute` | Mute/Unmute |
| `XF86AudioMicMute` | Mute microfone |

---

## 🔆 Brilho

| Atalho | Ação |
|--------|------|
| `XF86MonBrightnessUp` | Brilho + |
| `XF86MonBrightnessDown` | Brilho - |

---

## 🛠️ Utilitários

| Atalho | Ação |
|--------|------|
| `SUPER + C` | Clipboard manager (histórico) |
| `SUPER + SHIFT + C` | Color picker (hyprpicker) |
| `SUPER + L` | Bloquear tela (hyprlock) |
| `SUPER + SHIFT + R` | Recarregar Hyprland |

---

## 📋 Aliases do Terminal (após source ~/.zshrc)

### Navegação
| Comando | Ação |
|---------|------|
| `fm` | File Manager (Yazi) |
| `cd <pasta>` | Smart cd (zoxide) |
| `z <pasta>` | Jump para pasta frequente |

### Sistema
| Comando | Ação |
|---------|------|
| `mon` | System Monitor (btop) |
| `ls` | List (eza com ícones) |
| `ll` | List long |
| `la` | List all |
| `lt` | List tree |

### Desenvolvimento
| Comando | Ação |
|---------|------|
| `lg` | Lazygit |
| `vim` | Neovim |
| `cat` | Bat (com syntax) |

### Mídia e Rede
| Comando | Ação |
|---------|------|
| `music` | Spotify TUI |
| `bt` | Bluetui |
| `net` | nmtui |

---

## 🎨 Waybar (Interação com Mouse)

### Barra Superior
| Módulo | Click | Right-Click |
|--------|-------|-------------|
| 🚀 Launcher | Rofi | Yazi (file manager) |
| 🕐 Clock | - | - |
| ⏻ Power | Power menu | - |

### Barra Inferior
| Módulo | Click | Scroll |
|--------|-------|--------|
| 🎵 Media | Play/Pause | Volume |
| 🔊 Volume | - | Volume +/- |
| 🔵 Bluetooth | Bluetui | - |
| 📡 Network | nmtui | - |
| 🔋 Battery | - | - |

---

## 💡 Dicas de Produtividade

### 1. Fuzzy Finder (fzf)
```bash
Ctrl + R     # Buscar no histórico de comandos
Ctrl + T     # Buscar arquivos
Alt + C      # Buscar diretórios
```

### 2. Yazi (File Manager)
```
j/k          # Navegar
h/l          # Voltar/Entrar
Space        # Selecionar
y            # Copiar
d            # Recortar
p            # Colar
/            # Buscar
q            # Sair
```

### 3. btop (System Monitor)
```
q            # Sair
m            # Menu
+/-          # Zoom
f            # Filtrar
```

### 4. Lazygit
```
Space        # Stage/Unstage
c            # Commit
P            # Push
p            # Pull
n            # Nova branch
```

### 5. Spotify TUI
```
/            # Buscar
Space        # Play/Pause
> / <        # Próxima/Anterior
+ / -        # Volume
s            # Shuffle
r            # Repeat
```

---

## 🚀 Fluxo de Trabalho Sugerido

### Início do Dia
1. `SUPER + ALT + H` - Verificar sistema (btop)
2. `SUPER + SHIFT + N` - Conectar Wi-Fi/Bluetooth
3. `SUPER + ALT + M` - Iniciar música
4. `SUPER + R` - Abrir aplicações necessárias

### Desenvolvimento
1. `SUPER + SHIFT + D` - Abrir VS Code/Neovim
2. `SUPER + T` - Terminal
3. `SUPER + ALT + G` - Lazygit
4. `SUPER + ALT + F` - Navegação de arquivos (Yazi)

### Pausa/Descanso
1. `SUPER + SHIFT + M` - Controlar mídia
2. `SUPER + L` - Bloquear tela

---

## 📚 Recursos Adicionais

- **Hyprland Wiki**: https://wiki.hyprland.org/
- **Waybar Wiki**: https://github.com/Alexays/Waybar/wiki
- **Rofi Man Page**: `man rofi`
- **Documentação Local**: `CLI_APPS_GUIDE.md`

---

**Dica**: Imprima este guia ou mantenha aberto enquanto se familiariza com os atalhos! 

📌 **Atalho para este guia**: Adicione um alias no seu `.zshrc`:
```bash
alias keys='bat ~/Dotfiles/KEYBINDINGS.md'
```
