#!/usr/bin/env python3
"""
Waybar Weather Module - wttr.in version
Simple and reliable weather data without API keys
"""

import json
import sys
import urllib.request
import urllib.error
import urllib.parse
import re
from datetime import datetime

def get_location():
    """Get location automatically or use default"""
    try:
        # Try to get location automatically
        with urllib.request.urlopen("http://ipinfo.io/json", timeout=3) as response:
            data = json.loads(response.read().decode())
            return data.get("city", "São Paulo")
    except:
        return "São Paulo"  # Fallback location

def get_weather_data(location, detailed=False):
    """Get weather data from wttr.in"""
    try:
        # URL encode the location
        encoded_location = urllib.parse.quote(location)
        
        if detailed:
            # Detailed forecast
            url = f"https://wttr.in/{encoded_location}?format=j1"
        else:
            # Simple format: temperature + condition + icon
            url = f"https://wttr.in/{encoded_location}?format=%t+%C+%c"
        
        # Create request with user agent
        req = urllib.request.Request(url)
        req.add_header('User-Agent', 'Waybar Weather Module')
        
        with urllib.request.urlopen(req, timeout=10) as response:
            data = response.read().decode().strip()
            return data
    except Exception as e:
        print(f"Error getting weather: {e}", file=sys.stderr)
        return None

def format_simple_weather(data, location):
    """Format simple weather data for Waybar"""
    if not data:
        return {"text": "🌡️ N/A", "tooltip": "Weather data unavailable"}
    
    # Parse the simple format: "15°C Clear ☀️"
    parts = data.strip().split(' ')
    if len(parts) >= 3:
        temp = parts[0]
        condition = ' '.join(parts[1:-1]) if len(parts) > 3 else parts[1]
        icon = parts[-1]
        
        # Clean up condition
        condition = condition.replace('_', ' ').title()
        
        return {
            "text": f"{icon} {temp}",
            "alt": condition,
            "tooltip": f"📍 {location}\n{condition} • {temp}"
        }
    else:
        return {"text": f"🌡️ {data}", "tooltip": f"📍 {location}\nWeather info"}

def format_detailed_weather(data):
    """Format detailed weather data with region and 5-hour forecast"""
    try:
        weather_data = json.loads(data)
        current = weather_data["current_condition"][0]
        
        # Current weather info
        temp_c = current["temp_C"]
        feels_like = current["FeelsLikeC"]
        humidity = current["humidity"]
        wind_speed = current["windspeedKmph"]
        wind_dir = current["winddir16Point"]
        desc = current["weatherDesc"][0]["value"]
        
        # Get location info
        nearest_area = weather_data.get("nearest_area", [{}])[0]
        region = nearest_area.get("region", [{}])[0].get("value", "")
        country = nearest_area.get("country", [{}])[0].get("value", "")
        area_name = nearest_area.get("areaName", [{}])[0].get("value", "")
        
        location_text = area_name
        if region and region != area_name:
            location_text += f", {region}"
        if country:
            location_text += f", {country}"
        
        # Get weather icon based on condition
        icons = {
            "sunny": "☀️", "clear": "☀️", "partly cloudy": "⛅",
            "cloudy": "☁️", "overcast": "☁️", "mist": "🌫️",
            "fog": "🌫️", "rain": "🌧️", "drizzle": "🌦️",
            "snow": "🌨️", "thunderstorm": "⛈️", "sleet": "🌨️"
        }
        
        icon = "🌡️"
        desc_lower = desc.lower()
        for condition, emoji in icons.items():
            if condition in desc_lower:
                icon = emoji
                break
        
        # Today's forecast
        forecast = weather_data["weather"][0]
        min_temp = forecast["mintempC"]
        max_temp = forecast["maxtempC"]
        
        # Get hourly forecast (next 5 hours)
        hourly_forecast = []
        if "hourly" in forecast:
            current_hour = datetime.now().hour
            hourly_data = forecast["hourly"]
            
            # Get next 5 sequential hours
            for hour_offset in range(1, 6):  # 1, 2, 3, 4, 5 hours ahead
                target_hour = (current_hour + hour_offset) % 24
                
                # Find matching hour in data
                hour_data = None
                for data in hourly_data:
                    data_hour = int(data["time"]) // 100
                    if data_hour == target_hour:
                        hour_data = data
                        break
                
                if hour_data:
                    hour_temp = hour_data["tempC"]
                    hour_desc = hour_data["weatherDesc"][0]["value"]
                    hour_chance_rain = hour_data.get("chanceofrain", "0")
                    
                    # Format hour (24h format)
                    time_str = f"{target_hour:02d}:00"
                    
                    # Short weather description
                    short_desc = hour_desc.split()[0] if hour_desc else "N/A"
                    
                    # Add rain chance if significant
                    rain_info = ""
                    if int(hour_chance_rain) > 20:
                        rain_info = f" ({hour_chance_rain}% rain)"
                    
                    hourly_forecast.append(f"{time_str}: {hour_temp}°C {short_desc}{rain_info}")
        
        # Build tooltip
        text = f"{icon} {temp_c}°C"
        tooltip = f"📍 {location_text}\n"
        tooltip += f"{desc} • {temp_c}°C (feels like {feels_like}°C)\n"
        tooltip += f"Today: {min_temp}°C - {max_temp}°C\n"
        tooltip += f"Humidity: {humidity}% • Wind: {wind_speed}km/h {wind_dir}\n"
        
        # Add hourly forecast
        if hourly_forecast:
            tooltip += "\n⏰ Next 5 hours:\n"
            tooltip += "\n".join(hourly_forecast)
        
        return {
            "text": text,
            "alt": desc,
            "tooltip": tooltip
        }
    except Exception as e:
        return {"text": "🌡️ Error", "tooltip": f"Error parsing weather data: {str(e)}"}

def main():
    detailed = "--detailed" in sys.argv
    location = get_location()
    
    weather_data = get_weather_data(location, detailed)
    
    if detailed:
        result = format_detailed_weather(weather_data) if weather_data else {"text": "🌡️ N/A", "tooltip": "No data"}
    else:
        result = format_simple_weather(weather_data, location)
    
    print(json.dumps(result))

if __name__ == "__main__":
    main()