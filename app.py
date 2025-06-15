from flask import Flask, jsonify
import socket
from datetime import datetime
import requests
import os

app = Flask(__name__)

WEATHER_API_URL = "http://api.weatherapi.com/v1/current.json"
WEATHER_API_KEY = os.getenv("WEATHER_API_KEY")
CITY = "Dhaka"

@app.route("/api/hello", methods=["GET"])
def hello():
    hostname = socket.gethostname()
    current_time = datetime.now().strftime("%y%m%d%H%M")
    weather_info = get_weather()

    response = {
        "hostname": hostname,
        "datetime": current_time,
        "version": "1.0",
        "weather": {
            "dhaka": {
                "temperature": weather_info.get("temperature"),
                "temp_unit": "c"
            }
        }
    }
    return jsonify(response)

@app.route("/api/health", methods=["GET"])
def health():
    try:
        weather_info = get_weather()
        return jsonify({"status": "healthy", "weather_api_reachable": True})
    except:
        return jsonify({"status": "unhealthy", "weather_api_reachable": False}), 500

def get_weather():
    try:
        params = {"key": WEATHER_API_KEY, "q": CITY}
        response = requests.get(WEATHER_API_URL, params=params, timeout=5)
        data = response.json()
        return {"temperature": str(data["current"]["temp_c"])}
    except Exception as e:
        return {"temperature": "N/A"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

