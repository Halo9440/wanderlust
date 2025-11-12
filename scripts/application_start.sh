#!/bin/bash
cd /home/ubuntu/wanderlust

# Ensure Node.js 18 is available for PM2
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 18

echo "Starting backend with Node.js: $(node -v)"

# Start backend with PM2
cd backend
pm2 start npm --name "wanderlust-backend" -- start
pm2 save
cd ..

echo "Application started successfully"
