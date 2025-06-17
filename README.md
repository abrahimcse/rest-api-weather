# Weather REST API with AWS EKS Deployment

A fully automated CI/CD pipeline that builds, tests, and deploys a Flask weather API to AWS EKS using GitHub Actions.

---
## 📂 Project Structure

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
--- 

## Technologies Used

- **Terraform** – Infrastructure provisioning (EKS, IAM, VPC, etc.)
- **AWS EKS** – Managed Kubernetes Cluster
- **Docker & DockerHub** – Containerization and image registry
- **Kubernetes** – Application orchestration
- **GitHub Actions** – CI/CD pipeline
- **Secrets** – Used for AWS, Docker, and API keys

---

## Required GitHub Secrets
**GitHub → Repository Settings → Secrets → Actions**

| Secret Name              | Description                                 |
|--------------------------|---------------------------------------------|
| `AWS_ACCESS_KEY_ID`      | IAM user access key for Terraform           |
| `AWS_SECRET_ACCESS_KEY`  | IAM user secret key for Terraform           |
| `DOCKER_USERNAME`        | DockerHub username                          |
| `DOCKER_PASSWORD`        | DockerHub password or access token          |
| `WEATHER_API_KEY`        | Your third-party weather API key            |

These secrets are accessed inside the **CI/CD pipeline** and **Kubernetes secrets**.

---

## Features

- Real-time weather data for Dhaka
- Containerized with Docker
- Infrastructure as Code with Terraform
- CI/CD with GitHub Actions
- Health check endpoints
- Kubernetes secrets management

## API Endpoints

| Endpoint          | Method | Description                          |
|-------------------|--------|--------------------------------------|
| `/api/hello`      | GET    | Returns host info + weather data     |
| `/api/health`     | GET    | Health check + API availability      |


**Pipeline Stages**  
1. Docker image build & push to Docker Hub  
2. Terraform infrastructure provisioning  
3. Kubernetes deployment to EKS 
---

### Prerequisites
```bash
aws configure
terraform -v
kubectl version
docker --version
```
### Manual Deployment Steps

```bash
# 1. Build and Docker image
docker build -t abrahimcse/rest-api-weather .

# 2. Terraform deployment
cd terraform
terraform init
terraform apply -auto-approve

# 3. Kubernetes deployment
kubectl apply -f k8s/
```
### Monitoring
```bash
# Check pods
kubectl get pods -n default

# View logs
kubectl logs -f deployment/weather-api

# Access service
kubectl port-forward svc/weather-api 8080:80
```
### Cleanup
```bash
# Destroy Kubernetes resources
kubectl delete -f k8s/

# Destroy Terraform infrastructure
terraform destroy -auto-approve
```
---
## AWS EKS
```bash
aws configure
aws eks --region ap-southeast-1 update-kubeconfig --name my_eks_cluster
kubectl get nodes
kubectl get svc
```
### ✅ Expected Output:


> ➡️ Open your Browser 
    > http://<EXTERNAL-IP>/api/hello
    > http://<EXTERNAL-IP>/api/health

### ✅ Expected Response:


```bash
kubectl port-forward svc/weather-api-service 8080:80
```
> ➡️ Open your Browser 
    > http://localhost:8080/api/hello
    > http://localhost:8080/api/health