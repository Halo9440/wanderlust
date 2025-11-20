#!/bin/bash
cd /home/ubuntu/wanderlust

# Start backend with PM2
cd backend
pm2 stop wanderlust-backend || true
pm2 delete wanderlust-backend || true
pm2 start server.js --name "wanderlust-backend" --log /home/ubuntu/wanderlust/logs/backend.log

# Start frontend serve (if you're serving built files)
cd ../frontend
# If using serve for SPA
sudo npm install -g serve
pm2 stop wanderlust-frontend || true
pm2 delete wanderlust-frontend || true
pm2 start "serve -s dist -l 3000" --name "wanderlust-frontend" --log /home/ubuntu/wanderlust/logs/frontend.log

# Save PM2 configuration
pm2 save
pm2 startup
