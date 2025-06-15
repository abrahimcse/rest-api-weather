# Use a small Python base image
FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variable
ENV APP_VERSION=1.0

# Expose port
EXPOSE 5000

# Start app
CMD ["python", "app.py"]

