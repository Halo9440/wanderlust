#!/bin/bash
cd /home/ubuntu/wanderlust

# Install Node.js if not present
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Install backend dependencies
cd /home/ubuntu/wanderlust/backend
npm install

# Install PM2 globally
sudo npm install -g pm2
