#!/bin/bash
set -e

echo "Pulling latest images..."
docker compose pull

echo "Stopping old containers..."
docker compose down

echo "Starting new containers..."
docker compose up -d

echo "Waiting for app..."
sleep 10

echo "Verifying health..."
curl -f http://localhost:5000/health || exit 1

echo "✅ Staging deployment successful"

