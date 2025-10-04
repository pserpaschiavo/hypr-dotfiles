#!/usr/bin/env python3
"""
Waybar Weather Module - OpenWeatherMap version
More accurate weather data with API key (free tier available)
"""

import json
import sys
import urllib.request
import urllib.error
import os
from datetime import datetime

# Configuration
API_KEY_FILE = os.path.expanduser("~/.config/waybar/openweather_api_key")
DEFAULT_CITY = "São Paulo,BR"  # Change to your preferred city
UNITS = "metric"  # metric, imperial, or kelvin

def get_api_key():
    """Get API key from file"""
    try:
        if os.path.exists(API_KEY_FILE):
            with open(API_KEY_FILE, 'r') as f:
                return f.read().strip()
        else:
            return None
    except:
        return None

def get_weather_data(city, api_key):
    """Get weather data from OpenWeatherMap API"""
    try:
        base_url = "http://api.openweathermap.org/data/2.5/weather"
        url = f"{base_url}?q={city}&appid={api_key}&units={UNITS}"
        
        with urllib.request.urlopen(url, timeout=10) as response:
            data = json.loads(response.read().decode())
            return data
    except urllib.error.HTTPError as e:
        if e.code == 401:
            return {"error": "Invalid API key"}
        elif e.code == 404:
            return {"error": "City not found"}
        else:
            return {"error": f"HTTP {e.code}"}
    except Exception as e:
        return {"error": str(e)}

def get_weather_icon(weather_id, is_day=True):
    """Convert OpenWeatherMap weather ID to emoji"""
    # Weather condition IDs: https://openweathermap.org/weather-conditions
    icons = {
        # Thunderstorm
        200: "⛈️", 201: "⛈️", 202: "⛈️", 210: "🌩️", 211: "🌩️", 212: "⛈️", 221: "⛈️", 230: "⛈️", 231: "⛈️", 232: "⛈️",
        # Drizzle
        300: "🌦️", 301: "🌦️", 302: "🌧️", 310: "🌦️", 311: "🌧️", 312: "🌧️", 313: "🌦️", 314: "🌧️", 321: "🌦️",
        # Rain
        500: "🌦️", 501: "🌧️", 502: "🌧️", 503: "🌧️", 504: "🌧️", 511: "🌨️", 520: "🌦️", 521: "🌧️", 522: "🌧️", 531: "🌧️",
        # Snow
        600: "🌨️", 601: "🌨️", 602: "🌨️", 611: "🌨️", 612: "🌨️", 613: "🌨️", 615: "🌨️", 616: "🌨️", 620: "🌨️", 621: "🌨️", 622: "🌨️",
        # Atmosphere
        701: "🌫️", 711: "🌫️", 721: "🌫️", 731: "🌪️", 741: "🌫️", 751: "🌪️", 761: "🌪️", 762: "🌋", 771: "💨", 781: "🌪️",
        # Clear
        800: "☀️" if is_day else "🌙",
        # Clouds
        801: "🌤️" if is_day else "🌙", 802: "⛅", 803: "☁️", 804: "☁️"
    }
    
    return icons.get(weather_id, "🌡️")

def format_weather_data(data):
    """Format weather data for Waybar"""
    if "error" in data:
        return {
            "text": "🌡️ Error",
            "tooltip": f"Weather API Error: {data['error']}\n\nTo setup OpenWeatherMap:\n1. Get free API key at openweathermap.org\n2. Save it to: {API_KEY_FILE}"
        }
    
    try:
        main = data["main"]
        weather = data["weather"][0]
        wind = data.get("wind", {})
        sys_info = data["sys"]
        
        temp = round(main["temp"])
        feels_like = round(main["feels_like"])
        humidity = main["humidity"]
        pressure = main["pressure"]
        
        weather_id = weather["id"]
        description = weather["description"].title()
        
        # Check if it's day or night
        current_time = datetime.now().timestamp()
        sunrise = sys_info.get("sunrise", current_time)
        sunset = sys_info.get("sunset", current_time)
        is_day = sunrise <= current_time <= sunset
        
        icon = get_weather_icon(weather_id, is_day)
        
        wind_speed = wind.get("speed", 0)
        wind_dir = wind.get("deg", 0)
        
        # Convert wind direction to compass
        directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
        wind_direction = directions[round(wind_dir / 22.5) % 16] if wind_speed > 0 else ""
        
        city_name = data["name"]
        country = sys_info.get("country", "")
        
        text = f"{icon} {temp}°C"
        
        tooltip = f"{description} in {city_name}"
        if country:
            tooltip += f", {country}"
        tooltip += f"\n\n🌡️ Temperature: {temp}°C (feels like {feels_like}°C)"
        tooltip += f"\n💧 Humidity: {humidity}%"
        tooltip += f"\n📊 Pressure: {pressure} hPa"
        if wind_speed > 0:
            tooltip += f"\n💨 Wind: {wind_speed} m/s {wind_direction}"
        
        return {
            "text": text,
            "alt": description,
            "tooltip": tooltip
        }
        
    except Exception as e:
        return {
            "text": "🌡️ Parse Error", 
            "tooltip": f"Error parsing weather data: {str(e)}"
        }

def main():
    api_key = get_api_key()
    
    if not api_key:
        result = {
            "text": "🌡️ No API",
            "tooltip": f"OpenWeatherMap API key not found!\n\nSetup instructions:\n1. Register at openweathermap.org (free)\n2. Get your API key\n3. Save it to: {API_KEY_FILE}\n\nExample:\necho 'your_api_key_here' > {API_KEY_FILE}"
        }
        print(json.dumps(result))
        return
    
    city = DEFAULT_CITY
    weather_data = get_weather_data(city, api_key)
    result = format_weather_data(weather_data)
    
    print(json.dumps(result))

if __name__ == "__main__":
    main()