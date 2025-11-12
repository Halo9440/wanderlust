#!/bin/bash
set -e

echo "=== Validating Service ==="

# Load NVM properly
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 18

echo "Node.js version: $(node -v)"

sleep 15

echo "Checking PM2 status..."
if pm2 list | grep -q "wanderlust-backend"; then
    echo "✅ PM2 process is running"
    
    # Check application health
    echo "Testing application endpoint..."
    for i in {1..5}; do
        if curl -f http://localhost:5000/ > /dev/null 2>&1; then
            echo "✅ Application is healthy and responding on attempt $i"
            exit 0
        else
            echo "⚠️ Attempt $i: Application not responding, waiting..."
            sleep 5
        fi
    done
    
    echo "❌ Application failed to respond after multiple attempts"
    echo "PM2 status:"
    pm2 list
    echo "PM2 logs:"
    pm2 logs wanderlust-backend --lines 10
    exit 1
else
    echo "❌ PM2 process not found"
    echo "Current PM2 list:"
    pm2 list
    exit 1
fi
