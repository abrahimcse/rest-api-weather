# REST API Weather

A lightweight REST API built with Python and Flask. It returns server hostname, current datetime, version info, and live weather data for Dhaka. The API is containerized with Docker and deployed using a CI/CD pipeline via GitHub Actions.

---

## 🚀 Features

- `/api/hello`: Returns hostname, datetime, version, and live weather data for Dhaka.
- `/api/health`: API health check and external weather API availability.
- Uses [OpenWeatherMap](https://openweathermap.org/) for real-time weather data.
- CI/CD pipeline auto-builds and pushes Docker images to Docker Hub on every GitHub release.
- Supports zero-downtime deployment with Docker best practices.

---

## 📦 Technologies Used

- Python 3
- Flask
- Docker & Docker Compose
- GitHub Actions (CI/CD)
- OpenWeatherMap API

---

## 🔧 Local Development

### Prerequisites:
- Docker & Docker Compose
- `.env` file with:
    
    ```
    API_KEY=your_openweather_api_key
    APP_VERSION=1.0
    ```

### Run Locally:
```bash
docker compose up --build
```