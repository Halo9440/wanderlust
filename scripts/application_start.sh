#!/bin/bash
set -e
cd /home/ubuntu/wanderlust

# Start all apps defined in ecosystem.config.js
pm2 start ecosystem.config.js

# Save PM2 process list and enable startup on reboot
pm2 save
pm2 startup || true
