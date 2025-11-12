#!/bin/bash
cd /home/ubuntu/wanderlust

# Ensure Node.js 18 is available (only if needed)
if ! command -v node &> /dev/null || [[ $(node -v) != *"v18"* ]]; then
    echo "Setting up Node.js 18..."
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm use 18
fi

echo "Node.js version: $(node -v)"
echo "NPM version: $(npm -v)"

# Rest of your existing commands...
npm install
cd backend && npm install && cd ..
cd frontend && npm install && cd ..
