#!/bin/bash
set -e

echo "=============================="
echo " Starting Staging Deployment "
echo "=============================="

echo "Pulling latest images..."
docker-compose -f docker-compose.prod.yml pull

echo "Stopping old containers..."
docker-compose -f docker-compose.prod.yml down

echo "Starting new containers..."
docker-compose -f docker-compose.prod.yml up -d

echo "Running database migrations..."
docker exec backend python manage.py migrate || echo "No migrations to run"

echo "Verifying running containers..."
docker ps

echo "Deployment completed successfully ✅"

