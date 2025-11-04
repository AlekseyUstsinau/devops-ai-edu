# Corporate Website App - Docker Container

This directory contains the Docker configuration for deploying the corporate website static site using nginx.

## Build Instructions

```bash
# Build the Docker image
docker build -t corporate-website:latest .

# Run locally for testing
docker run -p 8080:80 corporate-website:latest
```

## Container Details

- **Base Image:** nginx:alpine (lightweight and secure)
- **User:** Non-root user (appuser) for security best practices
- **Port:** 80 (HTTP)
- **Content:** Serves `docs/demo-1/index.html` as the main page
- **Health Check:** Available at `/health` endpoint

## Testing

After running the container locally:
- Main site: http://localhost:8080
- Health check: http://localhost:8080/health

## Security Features

- Runs as non-root user (UID: 1001)
- Minimal nginx configuration
- No unnecessary packages or tools
- Alpine Linux base for reduced attack surface

## ECS Deployment

This container is designed to be deployed on AWS ECS Fargate with:
- Minimal resource allocation (0.25 vCPU, 0.5GB memory)
- Health checks configured for `/health` endpoint
- Logging to CloudWatch
- Integration with Application Load Balancer