#!/bin/bash
cd /home/ubuntu/wanderlust

# Load NVM
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 18

echo "Node.js version: $(node -v)"

# Install global dependencies
echo "Installing global dependencies..."
npm install -g pm2
npm install -g typescript

echo "PM2 version: $(pm2 --version)"

# Install project dependencies
echo "Installing root dependencies..."
npm install

echo "Installing backend dependencies..."
cd backend && npm install && cd ..

echo "Installing frontend dependencies..."
cd frontend && npm install && cd ..

echo "All dependencies installed successfully"
