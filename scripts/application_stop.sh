#!/bin/bash
# Stop the application if running
cd /home/ubuntu/wanderlust
pm2 stop all || true
pm2 delete all || true
