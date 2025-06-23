#!/bin/bash

# Development sync script for quick code changes
set -e

CONTAINER_NAME="docker-compose-pipeshub-ai-1"

echo "🔄 Development sync script for pipeshub-ai"
echo "📁 Watching for changes in source directories..."

# Function to sync Python files
sync_python() {
    echo "🐍 Syncing Python files..."
    docker cp ../../services/python/app/. $CONTAINER_NAME:/app/python/app/
    echo "✅ Python files synced"
}

# Function to sync Node.js files
sync_nodejs() {
    echo "🟢 Syncing Node.js files..."
    docker cp ../../services/nodejs/apps/src/. $CONTAINER_NAME:/app/backend/src/
    echo "✅ Node.js files synced"
}

# Function to restart services
restart_services() {
    echo "🔄 Restarting container..."
    docker compose -f docker-compose.dev.yml restart pipeshub-ai
    echo "✅ Container restarted"
}

# Check arguments
case "$1" in
    "python"|"py")
        sync_python
        restart_services
        ;;
    "nodejs"|"js"|"node")
        sync_nodejs
        restart_services
        ;;
    "all")
        sync_python
        sync_nodejs
        restart_services
        ;;
    *)
        echo "Usage: $0 {python|nodejs|all}"
        echo "  python - Sync Python files only"
        echo "  nodejs - Sync Node.js files only"
        echo "  all    - Sync all files"
        exit 1
        ;;
esac

echo "🎉 Sync complete!" 