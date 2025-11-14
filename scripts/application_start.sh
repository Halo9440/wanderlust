#!/bin/bash
echo "ApplicationStart - Starting backend server..."
cd /var/www/application/wanderlust/backend

# Start the backend server
export NODE_ENV=production
nohup node server.js > /var/log/wanderlust-app.log 2>&1 &

echo "Backend server starting on port 5000..."
sleep 5

# Verify server is running
if curl -s http://localhost:5000 > /dev/null; then
    echo "✅ Backend server started successfully!"
    IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
    echo "🌐 Access your application at: http://$IP:5000"
else
    echo "❌ Backend server failed to start"
    echo "Check logs: tail -f /var/log/wanderlust-app.log"
    exit 1
fi
