#!/bin/bash
echo "Starting Wanderlust backend server..."
cd /var/www/wanderlust-backend

# Install dependencies
if [ ! -d "node_modules" ]; then
    echo "Installing backend dependencies..."
    npm install
fi

# Start the backend server
echo "Starting Node.js backend on port 5000..."
npm start > /var/log/wanderlust-backend.log 2>&1 &
echo "Backend server started successfully!"
