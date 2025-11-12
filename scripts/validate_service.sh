#!/bin/bash
# Validate that the service is running
sleep 10
if pm2 list | grep -q "wanderlust-backend"; then
    echo "Application is running successfully"
    exit 0
else
    echo "Application failed to start"
    exit 1
fi
