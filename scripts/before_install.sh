#!/bin/bash
set -e

# Ensure logs directory exists
mkdir -p /home/ubuntu/wanderlust/logs

# Stop and remove any existing PM2 processes
pm2 stop wanderlust-backend || true
pm2 delete wanderlust-backend || true
pm2 stop wanderlust-frontend || true
pm2 delete wanderlust-frontend || true
