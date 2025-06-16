# REST API Weather

A lightweight REST API built with Python and Flask. It returns server hostname, current datetime, version info, and live weather data for Dhaka. The API is containerized with Docker and deployed using a CI/CD pipeline via GitHub Actions.

---

```pgsql
rest-api-weather/
├── app.py                  ✅ Flask application logic (your main backend code)
├── Dockerfile              ✅ Instructions to build Docker image for deployment
├── requirements.txt        ✅ Lists Python dependencies (Flask, requests, etc.)
├── .env                    ✅ Local environment variables (like API keys, not used in production)
├── .dockerignore           ✅ Specifies files to exclude from the Docker image build
│
├── k8s/                    ✅ Kubernetes resource manifests
│   ├── deployment.yaml     ✅ Defines how the Flask app will be deployed in Kubernetes
│   ├── service.yaml        ✅ Exposes the app via a LoadBalancer or NodePort
│   └── secret.yaml         ✅ Stores sensitive data like API keys securely in Kubernetes
│
├── terraform/              ✅ Infrastructure as Code (IaC) using Terraform
│   ├── main.tf             ✅ Provisions AWS resources like EKS Cluster, VPC, Subnet, IAM roles
│   ├── variables.tf        ✅ Declares input variables like region, cluster name
│   ├── versions.tf         ✅ Specifies required Terraform and provider versions
│   ├── outputs.tf          ✅ Outputs important values like cluster name, subnet IDs
│
└── .github/                ✅ GitHub Actions configuration for CI/CD
    └── workflows/
        └── deploy.yml      ✅ Automates your pipeline:
                             → Build Docker image
                             → Push to DockerHub
                             → Deploy to Kubernetes
                             → Optionally run Terraform

```



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
