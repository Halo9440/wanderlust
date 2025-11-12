#!/bin/bash
echo "Stopping application..."
cd /home/ubuntu/wanderlust
pm2 stop all || true
pm2 delete all || true
echo "Application stopped"
exit 0
