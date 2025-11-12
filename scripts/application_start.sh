#!/bin/bash
cd /home/ubuntu/wanderlust

# Set up Node.js path
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 18

cd backend

echo "Starting application..."
pm2 stop all || true
pm2 delete all || true
pm2 start npm --name "wanderlust-backend" -- start

echo "Application started"
exit 0
