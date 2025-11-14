#!/bin/bash
echo "BeforeInstall - Stopping any running application..."
# Stop any existing Node.js application
pkill -f "node.*server.js" || true
