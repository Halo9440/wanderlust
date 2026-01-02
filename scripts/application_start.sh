#!/bin/bash
set -e

cd /home/ubuntu/wanderlust

# Start both backend and frontend using PM2 ecosystem file
pm2 start ecosystem.config.js

# Save PM2 process list and enable startup on reboot
pm2 save
pm2 startup || true
