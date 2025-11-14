#!/bin/bash
echo "ApplicationStop - Stopping application..."
pkill -f "node.*server.js" || true
