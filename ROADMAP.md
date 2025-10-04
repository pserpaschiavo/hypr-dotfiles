# Roadmap de Configuração do Ambiente Hyprland

Este documento serve como um guia e checklist para a construção de um ambiente de desktop completo, coeso e automatizado sobre o Hyprland.

## Fase 1: A Base Sólida (O "Core System")

*O objetivo desta fase é ter um sistema 100% funcional, mesmo que a aparência ainda não esteja polida.*

### compositor: Hyprland
- [ ] Configurar layout de monitores e resoluções no `hyprland.conf`.
- [ ] Definir atalhos de teclado essenciais (abrir terminal, fechar janela, launcher).
- [ ] Criar regras de janela (`windowrule`) para aplicativos principais (ex: navegadores, players de música).

### autenticação: SDDM (Simple Desktop Display Manager)
- [ ] Garantir que o pacote `sddm` esteja instalado.
- [ ] Instalar um tema customizado (ex: `sddm-sugar-candy-git` via AUR).
- [ ] Aplicar o tema via arquivo de configuração em `/etc/sddm.conf.d/theme.conf`.
- [ ] Habilitar o serviço do systemd (`sudo systemctl enable sddm.service`).

### barra_de_status: Waybar
- [ ] Configurar os módulos essenciais já desenvolvidos:
    - [ ] `hyprland/workspaces`
    - [ ] `pulseaudio` (saída de som)
    - [ ] `custom/microphone` (entrada de som)
    - [ ] `custom/weather`
    - [ ] `clock`
    - [ ] `tray`
- [ ] Afinar o estilo no `style.css` para um visual inicial consistente.

### terminal: Ghostty
- [ ] Validar que a Nerd Font está configurada corretamente.
- [ ] Definir um esquema de cores base inicial no arquivo de configuração.

### notificações: Dunst
- [ ] Instalar o pacote (`sudo pacman -S dunst`).
- [ ] Adicionar `exec-once = dunst` ao `hyprland.conf` para autostart.
- [ ] Realizar a configuração inicial de posição e aparência no `~/.config/dunst/dunstrc`.

## Fase 2: A Estética Dinâmica (O "Camaleão")

*O objetivo desta fase é automatizar a aparência do sistema para que ela se adapte ao papel de parede.*

### gerenciador_de_wallpaper: Hyprpaper
- [ ] Garantir que o pacote `hyprpaper` esteja instalado.
- [ ] Criar o arquivo de configuração `~/.config/hyprpaper/hyprpaper.conf` com um wallpaper padrão.
- [ ] Adicionar `exec-once = hyprpaper` no `hyprland.conf`.

### motor_de_temas: Wallust
- [ ] Instalar o pacote (`yay -S wallust`).
- [ ] Criar o arquivo de configuração `~/.config/wallust/wallust.toml`.
- [ ] Mapear os "templates" dos programas a serem modificados (Waybar, Rofi, Dunst, Ghostty, etc.).
- [ ] Editar os arquivos de configuração de cada programa para inserir as variáveis do Wallust (ex: `{color1}`, `{background}`).

### automação_de_tema: Script Centralizador
- [ ] Criar um script (`set-theme.sh`) que realiza o fluxo completo:
    ```sh
    # 1. Usar Rofi para selecionar um novo wallpaper.
    # 2. Aplicar o wallpaper via 'hyprctl hyprpaper'.
    # 3. Aplicar a paleta de cores via 'wallust'.
    ```
- [ ] Criar um atalho de teclado no `hyprland.conf` para executar este script.

## Fase 3: A Interatividade (Os "Superpoderes" do Rofi)

*O objetivo desta fase é expandir o uso do Rofi para gerenciar o sistema de forma rápida e eficiente.*

### launcher_de_apps: Rofi
- [ ] Garantir que o `launcher.sh` do `adi1090x` está funcionando.
- [ ] Criar um módulo `custom/launcher` no Waybar para chamar o script.

### power_menu: Rofi
- [ ] Garantir que o `powermenu.sh` do `adi1090x` está funcionando.
- [ ] Criar um módulo `custom/power` no Waybar para chamar o script.

### menus_de_controle: Rofi Scripts
- [ ] **Screenshots:**
    - [ ] Instalar `grim` e `slurp` (`sudo pacman -S grim slurp`).
    - [ ] Criar um script que usa Rofi para dar opções ("Área", "Janela", "Tela Cheia") e executa o `grim` + `slurp`.
    - [ ] Criar um atalho de teclado e/ou um botão no Waybar para o script.
- [ ] **Wi-Fi:**
    - [ ] Criar um script que usa `nmcli` para listar redes e conectar/desconectar via Rofi.
    - [ ] Criar um atalho ou botão para o script.
- [ ] **Clipboard:**
    - [ ] Instalar um gerenciador de clipboard para Wayland (ex: `cliphist`).
    - [ ] Integrar com Rofi para visualizar e pesquisar o histórico.

## Fase 4: Polimento e Qualidade de Vida

*O objetivo desta fase são os detalhes finais que tornam o ambiente robusto e agradável de usar no dia a dia.*

### consistência_visual: GTK / Qt
- [ ] Usar uma ferramenta como `nwg-look` para definir temas de ícones, cursores e widgets GTK.
- [ ] Instalar e configurar o `kvantum` e `qt6ct` para que os aplicativos Qt sigam o mesmo tema.

### segurança: Screen Locker
- [ ] Instalar um locker compatível com Wayland (ex: `swaylock-effects`).
- [ ] Criar um atalho de teclado no `hyprland.conf` para bloquear a tela (ex: `SUPER + L`).
- [ ] (Avançado) Configurar o `swayidle` para bloquear a tela automaticamente após inatividade.

### controles_de_hardware: Teclas de Mídia
- [ ] **Brilho da Tela:**
    - [ ] Instalar `brightnessctl`.
    - [ ] Mapear as teclas de aumentar/diminuir brilho no `hyprland.conf`.
- [ ] **Áudio e Microfone:**
    - [ ] Validar que as teclas de volume e mute estão funcionando conforme configurado no Waybar/`wpctl`.

---

Ao final deste roadmap, o ambiente estará completo, coeso e automatizado, refletindo um setup de alto nível.
