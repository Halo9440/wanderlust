#!/bin/bash
cd /home/ubuntu/wanderlust

# Load NVM properly
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 18

echo "Starting backend application with Node.js: $(node -v)"

cd backend

# Stop any existing processes
pm2 stop all 2>/dev/null || true
pm2 delete all 2>/dev/null || true

# Start the application
pm2 start npm --name "wanderlust-backend" -- start

# Wait for application to start
sleep 10

# Check if application is running
if curl -f http://localhost:5000/ > /dev/null 2>&1; then
    echo "✅ Backend application started successfully and responding"
    exit 0
else
    echo "❌ Backend application failed to start"
    pm2 logs wanderlust-backend --lines 10
    exit 1
fi
