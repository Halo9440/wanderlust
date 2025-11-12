#!/bin/bash
cd /home/ubuntu/wanderlust

# Build frontend
cd frontend
npm run build
cd ..

# Start backend with PM2
cd backend
pm2 start npm --name "wanderlust-backend" -- start
pm2 save
pm2 startup
