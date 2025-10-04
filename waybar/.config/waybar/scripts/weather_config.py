# Waybar Weather Configuration
# Copy this file to ~/.config/waybar/weather_config.py to customize

# Default location (used if auto-detection fails)
# You can use city names, coordinates, or airport codes
# Examples: "São Paulo", "40.7128,-74.0060", "GRU"
DEFAULT_LOCATION = "São Paulo"

# Update interval in seconds (1800 = 30 minutes)
UPDATE_INTERVAL = 1800

# Temperature unit: "metric" (Celsius), "imperial" (Fahrenheit), or "kelvin"
TEMPERATURE_UNIT = "metric"

# Show detailed forecast on right-click?
ENABLE_DETAILED_FORECAST = True

# For OpenWeatherMap version (more accurate but requires API key):
# 1. Register for free at: https://openweathermap.org/api
# 2. Get your API key
# 3. Save it to: ~/.config/waybar/openweather_api_key
# 4. Change the module exec path to use weather_openweather.py instead

# Location format for OpenWeatherMap: "City,Country Code"
OPENWEATHER_LOCATION = "São Paulo,BR"