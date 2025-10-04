# Waybar Weather Module

Este módulo de clima melhorado oferece duas opções para obter dados meteorológicos via web.

## Opções Disponíveis

### 1. wttr.in (Recomendado - Não precisa de API key)
- **Script**: `weather_wttr.py`
- **Fonte**: wttr.in (serviço gratuito)
- **Configuração**: Automática (detecta localização via IP)
- **Funcionalidades**:
  - Temperatura atual com ícone do clima
  - Clique esquerdo: Abre wttr.in no navegador
  - Clique direito: Mostra previsão detalhada
  - Auto-detecção de localização

### 2. OpenWeatherMap (Mais preciso - Requer API key gratuita)
- **Script**: `weather_openweather.py`
- **Fonte**: OpenWeatherMap API
- **Configuração**: Precisa de API key (gratuita)
- **Funcionalidades**:
  - Dados mais precisos e detalhados
  - Informações de vento, umidade, pressão
  - Distinção dia/noite para ícones

## Como Usar

### Configuração Atual (wttr.in)
O módulo já está configurado para usar wttr.in. Simplesmente reinicie o Waybar:
```bash
pkill waybar && waybar &
```

### Mudar para OpenWeatherMap
1. **Obter API key gratuita**:
   - Registre-se em: https://openweathermap.org/api
   - Confirme seu email
   - Copie sua API key

2. **Configurar a API key**:
   ```bash
   echo "sua_api_key_aqui" > ~/.config/waybar/openweather_api_key
   ```

3. **Alterar o módulo**:
   No arquivo `ModulesCustom`, mude a linha:
   ```json
   "exec": "$HOME/Dotfiles/waybar/.config/waybar/scripts/weather_openweather.py",
   ```

### Personalização
Edite o arquivo `weather_config.py` para personalizar:
- Localização padrão
- Intervalo de atualização
- Unidade de temperatura

## Funcionalidades

### Interações
- **Clique esquerdo**: Abre site do clima no navegador
- **Clique direito**: Mostra previsão detalhada (wttr.in)
- **Tooltip**: Informações detalhadas ao passar o mouse

### Formato de Saída
- **Texto**: `🌤️ 22°C` (ícone + temperatura)
- **Tooltip**: Informações detalhadas com condição, umidade, vento, etc.

## Solução de Problemas

### "Weather data unavailable"
1. Verifique sua conexão com a internet
2. Teste manualmente: `curl "https://wttr.in/São Paulo?format=%t+%C+%c"`

### "No API" (OpenWeatherMap)
1. Verifique se a API key está salva corretamente
2. Teste: `cat ~/.config/waybar/openweather_api_key`

### Localização incorreta
1. Para wttr.in: O script detecta automaticamente via IP
2. Para OpenWeatherMap: Edite `OPENWEATHER_LOCATION` no config
3. Use formatos como: "São Paulo,BR", "New York,US", "London,GB"

## Arquivos

- `weather_wttr.py` - Script principal (wttr.in)
- `weather_openweather.py` - Script alternativo (OpenWeatherMap)
- `weather_config.py` - Configurações personalizáveis
- `README.md` - Este arquivo de documentação