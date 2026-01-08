#!/bin/bash
set -e

echo "Rolling back deployment..."
docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml up -d

echo "Rollback completed ⚠️"
