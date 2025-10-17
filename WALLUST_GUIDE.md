# 🎨 Guia Completo do Wallust

## 📖 O que é Wallust?

**Wallust** é um gerador automático de esquemas de cores baseado em wallpapers. Ele analisa uma imagem e extrai uma paleta de cores harmoniosa que é aplicada em todo o seu ambiente Hyprland.

---

## 🎯 Por que usar Wallust?

✅ **Temas automáticos** - Gera cores baseadas no seu wallpaper  
✅ **Consistência visual** - Todas as aplicações usam as mesmas cores  
✅ **Mudança rápida** - Troque o wallpaper, o tema muda junto  
✅ **Personalização** - Ajuste saturação, brilho, contraste  
✅ **Compatibilidade** - Funciona com Waybar, Rofi, Dunst, Ghostty, Hyprland  

---

## 📦 Instalação

### Automática (Recomendado)
```bash
cd ~/Dotfiles
./scripts/setup-wallust.sh
```

### Manual
```bash
# Instalar Wallust
yay -S wallust

# Instalar pywal (backend)
sudo pacman -S python-pywal

# Criar estrutura de diretórios
mkdir -p ~/.config/wallust/templates
mkdir -p ~/Pictures/Wallpapers
```

---

## 🚀 Como Usar

### 1️⃣ Método Rápido (Atalhos de Teclado)

No Hyprland, use os atalhos:

| Atalho | Ação |
|--------|------|
| `SUPER + W` | **Selecionar** wallpaper com Rofi |
| `SUPER + SHIFT + W` | Wallpaper **aleatório** |
| `SUPER + CTRL + W` | **Último** wallpaper usado |

### 2️⃣ Linha de Comando

```bash
# Mudar wallpaper e gerar cores
./scripts/change-wallpaper.sh /caminho/para/imagem.jpg

# Wallpaper aleatório
./scripts/change-wallpaper.sh --random

# Selecionar com rofi
./scripts/change-wallpaper.sh --select

# Usar último wallpaper
./scripts/change-wallpaper.sh --last
```

### 3️⃣ Wallust Puro (Avançado)

```bash
# Apenas gerar cores (sem mudar wallpaper)
wallust run ~/Pictures/Wallpapers/meu-wallpaper.jpg

# Ver paleta gerada
wallust show

# Gerar apenas templates
wallust generate
```

---

## ⚙️ Configuração

O arquivo de configuração está em: `~/.config/wallust/wallust.toml`

### Backend

```toml
# Backend de extração de cores
backend = "wal"  # Opções: resample, kmeans, thumb, wal

# Espaço de cores
color_space = "lab"  # Opções: lab, lch, rgb
```

**Qual backend escolher?**
- `wal` - Pywal algorithm (recomendado, cores vibrantes)
- `kmeans` - K-means clustering (cores mais precisas)
- `resample` - Downsampling (rápido, menos preciso)
- `thumb` - Thumbnail analysis (muito rápido)

### Saturação

```toml
# Ajustar saturação (-100 a 100)
saturate = 0.0   # 0 = sem mudança
                 # Positivo = mais saturado
                 # Negativo = menos saturado
```

**Exemplos:**
```bash
# Cores mais vibrantes
saturate = 20.0

# Cores mais suaves/pastel
saturate = -30.0
```

### Paleta

```toml
# Tipo de paleta
palette = "dark16"  # Opções: dark16, light16, dark8, light8

# Verificar contraste
check_contrast = true
```

### Templates

```toml
[templates]
"colors-waybar.css" = "~/.config/waybar/colors-wallust.css"
"colors-rofi.rasi" = "~/.config/rofi/colors-wallust.rasi"
"colors-dunst" = "~/.config/dunst/colors-wallust"
"hyprland-colors.conf" = "~/.config/hypr/colors-wallust.conf"
"colors-ghostty" = "~/.config/ghostty/colors-wallust"
```

---

## 🎨 Templates Criados

Wallust gera arquivos de cores para cada aplicação:

### Waybar
**Arquivo:** `~/.config/waybar/colors-wallust.css`

```css
@import "colors-wallust.css";
```

Variáveis disponíveis:
- `@define-color background` - Cor de fundo
- `@define-color foreground` - Cor de texto
- `@define-color color0` a `color15` - Paleta completa
- `@define-color primary`, `accent`, `success`, `warning`, `error`

### Rofi
**Arquivo:** `~/.config/rofi/colors-wallust.rasi`

```rasi
@import "colors-wallust.rasi"
```

### Dunst
**Arquivo:** `~/.config/dunst/colors-wallust`

Adicione no seu `dunstrc`:
```ini
[global]
include = ~/.config/dunst/colors-wallust
```

### Hyprland
**Arquivo:** `~/.config/hypr/colors-wallust.conf`

Adicione no `hyprland.conf`:
```conf
source = ~/.config/hypr/colors-wallust.conf
```

Variáveis disponíveis:
```conf
$background, $foreground
$color0 - $color15
$primary, $accent, $success, $warning, $error
```

### Ghostty
**Arquivo:** `~/.config/ghostty/colors-wallust`

Adicione no `config`:
```
config-file = ~/.config/ghostty/colors-wallust
```

---

## 🔧 Workflow Recomendado

### 1. Adicione seus Wallpapers
```bash
# Copie wallpapers para o diretório
cp ~/Downloads/*.jpg ~/Pictures/Wallpapers/
```

### 2. Teste Diferentes Wallpapers
```bash
# Use SUPER+W para abrir o seletor
# Ou teste na linha de comando
./scripts/change-wallpaper.sh --select
```

### 3. Ajuste a Configuração
Edite `~/.config/wallust/wallust.toml` se as cores não ficarem boas:

```toml
# Cores muito escuras? Tente:
saturate = 15.0

# Cores muito vibrantes? Tente:
saturate = -20.0

# Mudar algoritmo:
backend = "kmeans"
```

### 4. Aplique Novamente
```bash
# Re-processar o wallpaper atual
./scripts/change-wallpaper.sh --last
```

---

## 🎭 Exemplos de Uso

### Wallpapers Escuros
```toml
backend = "wal"
palette = "dark16"
saturate = 10.0
```

### Wallpapers Claros
```toml
backend = "wal"
palette = "light16"
saturate = 5.0
```

### Wallpapers Coloridos
```toml
backend = "kmeans"
palette = "dark16"
saturate = 20.0
```

### Wallpapers Minimalistas
```toml
backend = "resample"
palette = "dark8"
saturate = -10.0
```

---

## 🐛 Troubleshooting

### ❌ "wallust: command not found"
```bash
# Instalar wallust
yay -S wallust

# Ou executar o script
./scripts/setup-wallust.sh
```

### ❌ Cores não mudaram
```bash
# 1. Verificar se wallust foi executado
wallust show

# 2. Recarregar aplicações
pkill -SIGUSR2 waybar
pkill dunst && dunst &
hyprctl reload

# 3. Reiniciar Ghostty e Rofi
```

### ❌ Cores muito escuras/claras
Ajuste no `wallust.toml`:
```toml
# Cores muito escuras
saturate = 20.0

# Cores muito claras
saturate = -30.0

# Mudar palette
palette = "light16"  # ou "dark16"
```

### ❌ Templates não foram gerados
```bash
# Verificar configuração
cat ~/.config/wallust/wallust.toml

# Gerar templates manualmente
wallust generate

# Verificar se templates existem
ls ~/.config/wallust/templates/
```

### ❌ Wallpaper não muda
```bash
# Verificar hyprpaper
pgrep hyprpaper

# Reiniciar hyprpaper
pkill hyprpaper
hyprpaper &

# Usar script de mudança
./scripts/change-wallpaper.sh --last
```

---

## 💡 Dicas Profissionais

### 1. Organize seus Wallpapers
```bash
~/Pictures/Wallpapers/
├── Dark/
│   ├── nature-1.jpg
│   └── city-1.jpg
├── Light/
│   ├── minimal-1.jpg
│   └── abstract-1.jpg
└── Colorful/
    ├── sunset-1.jpg
    └── space-1.jpg
```

### 2. Crie Perfis
Copie `wallust.toml` para diferentes configurações:
```bash
~/.config/wallust/
├── wallust.toml           # Configuração padrão
├── wallust-vibrant.toml   # Cores vibrantes
├── wallust-pastel.toml    # Cores suaves
└── wallust-mono.toml      # Monocromático
```

### 3. Automatize com Scripts
```bash
# Mudar wallpaper ao iniciar
# Adicione no hyprland.conf:
exec-once = ~/Dotfiles/scripts/change-wallpaper.sh --random

# Mudar wallpaper a cada hora
exec-once = while true; do sleep 3600; ~/Dotfiles/scripts/change-wallpaper.sh --random; done &
```

### 4. Preview de Cores
```bash
# Ver paleta atual
wallust show

# Exportar cores em JSON
wallust export json > cores.json
cat cores.json | jq
```

---

## 📚 Recursos Adicionais

### Documentação Oficial
- [Codeberg - Wallust](https://codeberg.org/explosion-mental/wallust)
- [Pywal GitHub](https://github.com/dylanaraps/pywal)

### Templates Customizados
Crie seus próprios templates em `~/.config/wallust/templates/`:

```
# Exemplo: colors-custom.css
:root {
    --bg: {{color0}};
    --fg: {{color7}};
    --primary: {{color4}};
}
```

Adicione no `wallust.toml`:
```toml
[templates]
"colors-custom.css" = "~/.config/meu-app/colors.css"
```

### Integração com outros apps
Wallust é compatível com:
- ✅ Alacritty
- ✅ Kitty
- ✅ Waybar
- ✅ Rofi
- ✅ Dunst
- ✅ Sway
- ✅ Hyprland
- ✅ E muito mais!

---

## 🎨 Galeria de Exemplos

### Exemplo 1: Wallpaper Natureza
```bash
./scripts/change-wallpaper.sh ~/Pictures/Wallpapers/forest.jpg
```
**Resultado:** Tons verdes e marrons, perfeito para trabalho focado.

### Exemplo 2: Wallpaper Cyberpunk
```bash
./scripts/change-wallpaper.sh ~/Pictures/Wallpapers/neon-city.jpg
```
**Resultado:** Neons vibrantes, roxo e azul ciano.

### Exemplo 3: Wallpaper Minimalista
```bash
./scripts/change-wallpaper.sh ~/Pictures/Wallpapers/abstract.jpg
```
**Resultado:** Cores neutras, alta legibilidade.

---

## ✅ Checklist Pós-Instalação

- [ ] Wallust instalado (`wallust --version`)
- [ ] Templates criados (`ls ~/.config/wallust/templates/`)
- [ ] Wallpapers adicionados (`ls ~/Pictures/Wallpapers/`)
- [ ] Script testado (`./scripts/change-wallpaper.sh --help`)
- [ ] Atalhos funcionando (`SUPER+W`)
- [ ] Waybar recarregou com novas cores
- [ ] Dunst recarregou com novas cores
- [ ] Ghostty aberto com novas cores
- [ ] Rofi testado com novas cores

---

## 🎉 Pronto!

Agora você tem um sistema de temas completamente dinâmico!

**Próximos passos:**
1. Adicione seus wallpapers favoritos
2. Teste diferentes configurações
3. Crie seus próprios templates
4. Compartilhe suas paletas!

---

**Feito com 💙 para um Hyprland incrível!**

*Dúvidas? Todos os arquivos estão documentados em `~/Dotfiles/`*
