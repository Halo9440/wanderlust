#!/bin/bash
set -e
cd /home/ubuntu/wanderlust

# Start backend using PM2
cd backend
pm2 start server.js --name "wanderlust-backend" --time
cd ..

# Start frontend using PM2 and serve
cd frontend
pm2 start "serve -s dist -l 3000" --name "wanderlust-frontend" --time
cd ..

# Save PM2 process list and enable startup on reboot
pm2 save
pm2 startup || true
