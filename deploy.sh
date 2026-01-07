#!/bin/bash

echo "Pulling images..."
docker pull varshap100/capstone-backend:latest
docker pull varshap100/capstone-frontend:latest

echo "Removing old containers if they exist..."
docker rm -f capstone-backend 2>/dev/null
docker rm -f capstone-frontend 2>/dev/null

echo "Starting backend container..."
docker run -d -p 5001:5000 --name capstone-backend varshap100/capstone-backend:latest

echo "Starting frontend container..."
docker run -d -p 8080:80 --name capstone-frontend varshap100/capstone-frontend:latest

echo "Deployment completed successfully"
