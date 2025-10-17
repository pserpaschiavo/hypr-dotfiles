# 🎨 Hyprland Dotfiles

Configuração completa e personalizada do Hyprland para Arch Linux, focada em beleza, funcionalidade e acessibilidade.

## 📸 Preview

<!-- Adicionar screenshots aqui -->

## ✨ Componentes

- **Compositor**: [Hyprland](https://hyprland.org/) - Compositor Wayland dinâmico
- **Barra de Status**: [Waybar](https://github.com/Alexays/Waybar) - Altamente customizável
- **Launcher**: [Rofi](https://github.com/davatorium/rofi) - Application launcher e menus
- **Terminal**: [Ghostty](https://ghostty.org/) - Terminal moderno e rápido
- **Notificações**: [Dunst](https://dunst-project.org/) - Daemon de notificações leve
- **Wallpaper**: [Hyprpaper](https://github.com/hyprwm/hyprpaper) - Gerenciador de wallpapers
- **Temas**: [Wallust](https://codeberg.org/explosion-mental/wallust) - Geração automática de paletas de cores
- **Display Manager**: SDDM com tema Sugar Candy
- **File Manager**: Thunar com plugins

## 🚀 Instalação Rápida

### Método 1: Script Automatizado (Recomendado) 🎯

```bash
# 1. Clone o repositório
cd ~
git clone https://github.com/pserpaschiavo/hypr-dotfiles.git Dotfiles
cd Dotfiles

# 2. Execute o script master (instala e configura TUDO)
./scripts/setup-master.sh

# 3. Recarregue o shell
source ~/.zshrc

# 4. Aproveite! 🎉
```

### Método 2: Instalação Manual

Se preferir instalar componente por componente:

### Pré-requisitos

1. **Arch Linux** instalado e atualizado
2. **Git** instalado
3. Acesso de **sudo**

### Passo 1: Clone o Repositório

```bash
cd ~
git clone https://github.com/pserpaschiavo/hypr-dotfiles.git Dotfiles
cd Dotfiles
```

### Passo 2: Execute o Script de Instalação

```bash
./scripts/install-phase1.sh
```

Este script irá:
- ✓ Verificar e instalar todas as dependências necessárias
- ✓ Habilitar serviços do sistema (Bluetooth, NetworkManager)
- ✓ Preparar o ambiente para configuração

### Passo 3: Aplicar Configurações

```bash
# Criar symlinks para os arquivos de configuração
ln -sf ~/Dotfiles/hypr/.config/hypr ~/.config/
ln -sf ~/Dotfiles/waybar/.config/waybar ~/.config/
ln -sf ~/Dotfiles/rofi/.config/rofi ~/.config/
ln -sf ~/Dotfiles/dunst/.config/dunst ~/.config/
ln -sf ~/Dotfiles/ghostty/.config/ghostty ~/.config/
ln -sf ~/Dotfiles/hyprpaper/.config/hypr/hyprpaper.conf ~/.config/hypr/
```

### Passo 4: Configure SDDM (Opcional)

```bash
# Configurar SDDM como display manager
sudo systemctl enable sddm.service

# Configurar tema Sugar Candy
sudo cp /usr/share/sddm/themes/sugar-candy/theme.conf.user /etc/sddm.conf.d/theme.conf
```

### Passo 5: Recarregar ou Reiniciar

```bash
# Opção 1: Recarregar Hyprland (se já estiver usando)
hyprctl reload

# Opção 2: Reiniciar o sistema
reboot
```

## ⌨️ Atalhos de Teclado Principais

### 🚀 Menus Rápidos
- `SUPER + R` - Application Launcher
- `SUPER + SHIFT + S` - Menu Sistema
- `SUPER + SHIFT + N` - Menu Rede
- `SUPER + SHIFT + M` - Menu Mídia
- `SUPER + SHIFT + D` - Menu Desenvolvimento
- `SUPER + SHIFT + U` - Menu Utilitários
- `SUPER + SHIFT + L` - Power Menu

### 🖥️ Apps CLI no Ghostty
- `SUPER + ALT + F` - Yazi (File Manager)
- `SUPER + ALT + H` - btop (System Monitor)
- `SUPER + ALT + M` - Spotify TUI
- `SUPER + ALT + G` - Lazygit
- `SUPER + ALT + N` - nmtui (Wi-Fi)
- `SUPER + ALT + B` - bluetui (Bluetooth)

### Screenshots
- `Print` - Capturar tela inteira (copiar)
- `SHIFT + Print` - Capturar área selecionada (copiar)
- `CTRL + Print` - Capturar tela inteira (salvar)
- `CTRL + SHIFT + Print` - Capturar área selecionada (salvar)

### Workspaces
- `SUPER + 1-9` - Mudar para workspace 1-9
- `SUPER + SHIFT + 1-9` - Mover janela para workspace 1-9
- `SUPER + , / .` - Workspace anterior/próximo
- `SUPER + Tab` - Próximo workspace
- `SUPER + SHIFT + Tab` - Workspace anterior

### Navegação de Janelas
- `SUPER + Setas` - Mudar foco
- `SUPER + SHIFT + Setas` - Redimensionar janela
- `SUPER + CTRL + Setas` - Mover janela
- `SUPER + ALT + Setas` - Trocar janelas de posição
- `ALT + Tab` - Próxima janela

### Multimídia
- `XF86AudioRaiseVolume` - Aumentar volume
- `XF86AudioLowerVolume` - Diminuir volume
- `XF86AudioMute` - Silenciar
- `XF86AudioMicMute` - Silenciar microfone
- `XF86MonBrightnessUp` - Aumentar brilho
- `XF86MonBrightnessDown` - Diminuir brilho
- `XF86AudioPlay` - Play/Pause
- `XF86AudioNext` - Próxima faixa
- `XF86AudioPrev` - Faixa anterior

### Utilitários
- `SUPER + C` - Gerenciador de clipboard
- `SUPER + SHIFT + C` - Color picker

## 📁 Estrutura do Repositório

```
Dotfiles/
├── hypr/                    # Configurações do Hyprland
│   └── .config/hypr/
│       ├── hyprland.conf    # Configuração principal
│       └── scripts/         # Scripts auxiliares
├── waybar/                  # Configurações do Waybar
│   └── .config/waybar/
│       ├── config           # Configuração dos módulos
│       ├── Modules          # Definição dos módulos
│       └── style.css        # Estilos CSS
├── rofi/                    # Configurações do Rofi
│   └── .config/rofi/
├── dunst/                   # Configurações do Dunst
│   └── .config/dunst/
├── ghostty/                 # Configurações do Ghostty
│   └── .config/ghostty/
│       └── config           # Configuração do terminal
├── hyprpaper/               # Configurações do Hyprpaper
│   └── .config/hypr/
├── scripts/                 # Scripts de automação
│   ├── install-phase1.sh    # Instalação Fase 1
│   └── screenshot.sh        # Gerenciador de screenshots
├── WORKPLAN.md              # Plano de trabalho detalhado
├── ROADMAP.md               # Roadmap original
└── README.md                # Este arquivo
```

## 🎨 Customização

### Alterar Esquema de Cores

As cores são gerenciadas pelo Wallust e se adaptam automaticamente ao wallpaper.

```bash
# Instalar Wallust (já incluído no script de instalação)
yay -S wallust

# Gerar paleta a partir de uma imagem
wallust run ~/caminho/para/imagem.jpg
```

### Alterar Fontes

Edite o arquivo `~/.config/ghostty/config` e `~/.config/waybar/style.css` para alterar as fontes.

### Adicionar Módulos ao Waybar

Edite `~/.config/waybar/Modules` e `~/.config/waybar/config` para adicionar ou remover módulos.

## 🐛 Solução de Problemas

### Waybar não aparece

```bash
# Reiniciar Waybar
killall waybar && waybar &
```

### Dunst não mostra notificações

```bash
# Reiniciar Dunst
killall dunst && dunst &
```

### Hyprland não inicia

```bash
# Verificar logs
cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 1)/hyprland.log
```

### Atalhos de teclado não funcionam

```bash
# Recarregar configuração do Hyprland
hyprctl reload
```

## 📚 Documentação Adicional

- [WORKPLAN.md](./WORKPLAN.md) - Plano de trabalho completo com todas as fases
- [ROADMAP.md](./ROADMAP.md) - Roadmap original do projeto
- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Waybar Wiki](https://github.com/Alexays/Waybar/wiki)
- [Arch Wiki - Hyprland](https://wiki.archlinux.org/title/Hyprland)

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abrir um Pull Request

## 📝 TODO

Veja [WORKPLAN.md](./WORKPLAN.md) para a lista completa de tarefas e progresso.

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 🙏 Agradecimentos

- [Hyprland](https://hyprland.org/) - Por criar um compositor incrível
- [adi1090x](https://github.com/adi1090x/rofi) - Pelos temas do Rofi
- Comunidade Arch Linux
- Comunidade Hyprland

---

**Autor**: Phil (pserpaschiavo)  
**Sistema**: Arch Linux + Hyprland  
**Última Atualização**: Outubro 2025
