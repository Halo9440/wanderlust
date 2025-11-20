#!/bin/bash
sleep 30

# Check if backend is running
BACKEND_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/health || echo "000")
# Check if frontend is running  
FRONTEND_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000 || echo "000")

if [ "$BACKEND_RESPONSE" = "200" ] || [ "$FRONTEND_RESPONSE" = "200" ]; then
    echo "Application deployed successfully!"
    exit 0
else
    echo "Application deployment validation failed"
    exit 1
fi
