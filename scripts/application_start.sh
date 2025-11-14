#!/bin/bash
echo "ApplicationStart - Starting backend server..."
cd /var/www/application/wanderlust/backend

# Start the backend server
export NODE_ENV=production
nohup node server.js > /var/log/wanderlust-app.log 2>&1 &

echo "Backend server started on port 3000"
echo "Check application logs: /var/log/wanderlust-app.log"

# Wait a bit and check if server is running
sleep 3
if pgrep -f "node server.js" > /dev/null; then
    echo "✅ Backend server is running successfully"
else
    echo "❌ Backend server failed to start. Check logs above."
fi
