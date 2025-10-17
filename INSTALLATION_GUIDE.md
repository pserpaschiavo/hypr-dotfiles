# 🚀 INSTALAÇÃO ÚNICA - HYPRLAND COMPLETO

## 🎯 O que este guia faz?

Este é o **guia definitivo** para instalar TODO o ambiente Hyprland de uma vez só, incluindo:

✅ Configuração automática do Hyprland para iniciar ao liga├── .config-backup-YYYYMMDD_HHMMSS/  → Backup das configs antigas

/etc/
├── sddm.conf          → Configuração SDDM (login com senha)
│
/usr/share/ 
✅ Auto-login opcional (sem senha)  
✅ Todas as dependências e aplicações  
✅ Todos os scripts e configurações  
✅ Temas dinâmicos com Wallust  
✅ Validação completa da instalação  

---

## ⚡ INSTALAÇÃO RÁPIDA (1 COMANDO)

### Para instalar TUDO automaticamente:

```bash
cd ~/Dotfiles
./scripts/orchestrator.sh
```

**Pronto!** O script perguntará o que você quer durante a instalação.

---

## 📋 O que o Orchestrator faz?

### **FASE 1: Verificações Iniciais** 🔍
- Verifica se você está no Arch Linux
- Checa se `yay` está instalado
- Confirma que está no diretório correto

### **FASE 2: Backup** 📦
- Faz backup automático de configs existentes
- Salva em: `~/.config-backup-YYYYMMDD_HHMMSS/`

### **FASE 3: Instalação do Sistema** 📦
Executa: `install-phase1.sh`
- Hyprland, Waybar, Rofi, Dunst
- Hyprpaper, Ghostty, Polkit
- Ferramentas Wayland
- NetworkManager, Bluetooth
- Fontes Nerd Font

### **FASE 4: Cursores** 🖱️
Executa: `setup-cursors.sh`
- Nordzy Cursors
- Configuração GTK
- Configuração Hyprland

### **FASE 5: Apps CLI** 🖥️
Executa: `install-cli-apps.sh`
- 30+ aplicações CLI
- Aliases no .zshrc
- Yazi, btop, lazygit, spotify-tui
- fzf, ripgrep, bat, eza, zoxide

### **FASE 6: Wallust** 🎨
Executa: `setup-wallust.sh`
- Wallust + pywal
- Templates para todos os apps
- Diretório de wallpapers

### **FASE 7: Symlinks** 🔗
Cria links simbólicos para:
- Hyprland → `~/.config/hypr`
- Waybar → `~/.config/waybar`
- Dunst → `~/.config/dunst`
- Rofi → `~/.config/rofi`
- Ghostty → `~/.config/ghostty`
- Wallust → `~/.config/wallust`
- Hyprpaper → `~/.config/hyprpaper`

### **FASE 8: SDDM** 🖥️
Executa: `setup-sddm.sh` (pergunta antes)
- Instala SDDM
- Tema Sugar Candy
- Habilita na inicialização

### **FASE 9: Login Seguro** 🔐
Configuração automática de segurança:
- Senha **sempre obrigatória**
- Remove qualquer configuração de auto-login anterior
- Login seguro no SDDM

### **FASE 10: Hyprland Padrão** 🎯
- Configura Hyprland como sessão padrão
- Cria arquivo `/usr/share/wayland-sessions/hyprland.desktop`
- Garante que SDDM saiba sobre o Hyprland

### **FASE 11: Reload** 🔄
- Recarrega Waybar
- Recarrega Dunst
- Recarrega Hyprland (se estiver rodando)

### **FASE 12: Validação** ✅
- Verifica todas as instalações
- Checa symlinks
- Confirma SDDM
- Mostra resumo final

---

## 🎮 Fluxo Interativo

Durante a instalação, o script perguntará:

### 1. Confirmação inicial
```
Continuar com a instalação completa? [Y/n]:
```

### 2. SDDM (Display Manager)
```
Instalar e configurar SDDM? [y/N]:
```
**Responda `y`** se quiser que o PC inicie no login gráfico.

### 3. Login Seguro ✅
```
🔐 FASE 7: CONFIGURAÇÃO DE LOGIN SEGURO
✓ Senha obrigatória habilitada (padrão)
```
**Automático** - Senha sempre será necessária para login.

---

## 🔧 Instalação Manual (Passo a Passo)

Se preferir controle total, execute os scripts individualmente:

```bash
cd ~/Dotfiles

# 1. Dependências do sistema
./scripts/install-phase1.sh

# 2. Cursores
./scripts/setup-cursors.sh

# 3. Apps CLI
./scripts/install-cli-apps.sh

# 4. Wallust
./scripts/setup-wallust.sh

# 5. SDDM (opcional)
./scripts/setup-sddm.sh

# 6. Criar symlinks manualmente
ln -sf ~/Dotfiles/hypr/.config/hypr ~/.config/hypr
ln -sf ~/Dotfiles/waybar/.config/waybar ~/.config/waybar
ln -sf ~/Dotfiles/dunst/.config/dunst ~/.config/dunst
ln -sf ~/Dotfiles/rofi/.config/rofi ~/.config/rofi
ln -sf ~/Dotfiles/ghostty/.config/ghostty ~/.config/ghostty
ln -sf ~/Dotfiles/wallust/.config/wallust ~/.config/wallust
ln -sf ~/Dotfiles/hyprpaper/.config/hyprpaper ~/.config/hyprpaper

# 7. Habilitar SDDM (se instalado)
sudo systemctl enable sddm
sudo systemctl start sddm
```

---

## 🖥️ Como Funciona o Boot?

### Com SDDM (Recomendado - Seguro) 🔐:
```
PC Liga → GRUB → Arch Linux → SDDM mostra tela de login
       → Você digita usuário + senha
       → Seleciona "Hyprland" (se não for padrão)
       → Hyprland inicia!
```

**✅ Senha sempre obrigatória para maior segurança**

### Sem SDDM (TTY):
```
PC Liga → GRUB → Arch Linux → TTY (terminal)
       → Login manual: usuário + senha
       → Digite: Hyprland
       → Hyprland inicia
```

---

## 📁 Estrutura de Arquivos Após Instalação

```
/home/phil/
├── .config/
│   ├── hypr/          → symlink para ~/Dotfiles/hypr/.config/hypr
│   ├── waybar/        → symlink para ~/Dotfiles/waybar/.config/waybar
│   ├── dunst/         → symlink para ~/Dotfiles/dunst/.config/dunst
│   ├── rofi/          → symlink para ~/Dotfiles/rofi/.config/rofi
│   ├── ghostty/       → symlink para ~/Dotfiles/ghostty/.config/ghostty
│   ├── wallust/       → symlink para ~/Dotfiles/wallust/.config/wallust
│   └── hyprpaper/     → symlink para ~/Dotfiles/hyprpaper/.config/hyprpaper
│
├── Pictures/
│   └── Wallpapers/    → Seus wallpapers aqui!
│
├── Dotfiles/
│   ├── scripts/
│   │   ├── orchestrator.sh       ⭐ SCRIPT MASTER
│   │   ├── install-phase1.sh
│   │   ├── setup-cursors.sh
│   │   ├── install-cli-apps.sh
│   │   ├── setup-wallust.sh
│   │   ├── setup-sddm.sh
│   │   ├── change-wallpaper.sh
│   │   └── rofi-menus/
│   │
│   ├── hypr/
│   ├── waybar/
│   ├── dunst/
│   ├── rofi/
│   ├── ghostty/
│   └── wallust/
│
└── .config-backup-YYYYMMDD_HHMMSS/  → Backup das configs antigas

/etc/
├── sddm.conf.d/
│   └── autologin.conf  → Auto-login (se configurado)
│
/usr/share/
└── wayland-sessions/
    └── hyprland.desktop  → Sessão Hyprland para SDDM
```

---

## ✅ Checklist Pós-Instalação

Após executar o orchestrator, verifique:

- [ ] Script executado sem erros
- [ ] Mensagem "✨ INSTALAÇÃO COMPLETA! ✨" apareceu
- [ ] SDDM habilitado: `systemctl is-enabled sddm`
- [ ] Sessão Hyprland existe: `ls /usr/share/wayland-sessions/hyprland.desktop`
- [ ] Symlinks criados: `ls -la ~/.config/hypr`
- [ ] Reiniciar o sistema: `sudo reboot`

---

## 🎯 Primeiro Boot no Hyprland

### Após reiniciar:

1. **Tela SDDM aparece** 🔐
   - Digite seu usuário
   - Digite sua senha
   
2. **Selecione Hyprland**
   - Clique no ícone de sessão (canto superior esquerdo/direito)
   - Escolha "Hyprland"
   - Pressione Enter

3. **Hyprland inicia!** 🎉

### Teste os atalhos:

```bash
SUPER + Return        # Abrir terminal (Ghostty)
SUPER + R             # Rofi launcher
SUPER + SHIFT + S     # Menu sistema
SUPER + W             # Mudar wallpaper
SUPER + Q             # Fechar janela
```

### Configure seu primeiro wallpaper:

```bash
# Adicione wallpapers
cp ~/Downloads/*.jpg ~/Pictures/Wallpapers/

# Selecione um wallpaper
SUPER + W

# Ou via terminal
./scripts/change-wallpaper.sh --select
```

---

## 🔄 Atualizações Futuras

Para atualizar suas configs:

```bash
cd ~/Dotfiles

# Pull das atualizações
git pull

# Re-executar orchestrator (só instala o que falta)
./scripts/orchestrator.sh

# Ou atualizar manualmente
hyprctl reload
pkill -SIGUSR2 waybar
```

---

## 🐛 Troubleshooting

### ❌ "SDDM não inicia"
```bash
# Verificar status
systemctl status sddm

# Habilitar e iniciar
sudo systemctl enable sddm
sudo systemctl start sddm

# Ver logs
journalctl -u sddm -b
```

### ❌ "Hyprland não aparece no SDDM"
```bash
# Verificar arquivo de sessão
ls -la /usr/share/wayland-sessions/hyprland.desktop

# Recriar se necessário
sudo tee /usr/share/wayland-sessions/hyprland.desktop <<EOF
[Desktop Entry]
Name=Hyprland
Comment=An intelligent dynamic tiling Wayland compositor
Exec=Hyprland
Type=Application
EOF
```

### ❌ "Senha não é aceita"
```bash
# Verificar se usuário existe
whoami

# Verificar grupos do usuário
groups

# Resetar senha se necessário
sudo passwd $(whoami)

# Verificar se SDDM está configurado corretamente
cat /etc/sddm.conf
```

### ❌ "Tela preta após login"
```bash
# Voltar para TTY: Ctrl+Alt+F2
# Login no terminal

# Verificar logs do Hyprland
cat ~/.hyprland/hyprland.log

# Testar Hyprland manualmente
Hyprland

# Se funcionar, problema está no SDDM
```

### ❌ "Scripts não executam"
```bash
# Dar permissão de execução
chmod +x ~/Dotfiles/scripts/*.sh
chmod +x ~/Dotfiles/scripts/rofi-menus/*.sh
```

---

## 📚 Próximos Passos

Após a instalação, leia:

1. **Atalhos de Teclado**
   ```bash
   bat ~/Dotfiles/KEYBINDINGS.md
   ```

2. **Guia de Apps CLI**
   ```bash
   bat ~/Dotfiles/CLI_APPS_GUIDE.md
   ```

3. **Guia do Wallust**
   ```bash
   bat ~/Dotfiles/WALLUST_GUIDE.md
   ```

4. **README Principal**
   ```bash
   bat ~/Dotfiles/README.md
   ```

---

## 🎊 Resultado Final

Ao completar esta instalação, você terá:

✅ **Login Seguro** - Senha sempre obrigatória 🔐  
✅ **Boot no SDDM** - Tela de login gráfica moderna  
✅ **Hyprland Padrão** - Sessão configurada automaticamente  
✅ **Interface Completa** - Waybar, Rofi, Dunst funcionando  
✅ **Temas Dinâmicos** - Wallust gera cores do wallpaper  
✅ **30+ Apps CLI** - Yazi, btop, lazygit, spotify-tui, etc  
✅ **5 Menus Contextuais** - Sistema, Rede, Mídia, Dev, Utilitários  
✅ **50+ Atalhos** - Workflow 100% teclado  
✅ **Documentação** - 7 guias completos  

---

## 🏆 Comandos Essenciais

```bash
# Instalação completa
cd ~/Dotfiles && ./scripts/orchestrator.sh

# Recarregar Hyprland
hyprctl reload

# Recarregar Waybar
pkill -SIGUSR2 waybar

# Mudar wallpaper
SUPER + W

# Abrir menus
SUPER + SHIFT + S  # Sistema
SUPER + SHIFT + N  # Rede
SUPER + SHIFT + M  # Mídia
SUPER + SHIFT + D  # Dev
SUPER + SHIFT + U  # Utilitários

# Apps CLI rápidos
fm      # Yazi
mon     # btop
lg      # Lazygit
music   # Spotify TUI
```

---

## 💡 Dicas Finais

### Para melhor experiência:

1. **Adicione wallpapers antes** de executar o orchestrator
   ```bash
   mkdir -p ~/Pictures/Wallpapers
   cp ~/Downloads/*.jpg ~/Pictures/Wallpapers/
   ```

2. **Garanta uma senha forte** - O login é sempre protegido 🔐

3. **Leia KEYBINDINGS.md** para memorizar atalhos

4. **Teste cada menu Rofi** após a instalação

5. **Execute** `wallust run` em diferentes wallpapers para ver temas

---

## 🎉 Pronto!

Execute o orchestrator e aproveite seu novo ambiente Hyprland!

```bash
cd ~/Dotfiles
./scripts/orchestrator.sh
```

**Boa sorte e divirta-se! 🚀**

---

**Feito com 💙 para um setup perfeito!**

*Qualquer problema, revise os logs e a documentação.*
