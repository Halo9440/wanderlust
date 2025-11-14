#!/bin/bash
echo "AfterInstall - Setting up backend..."
cd /var/www/application/wanderlust/backend

# Install production dependencies
npm install --production

# Set proper permissions
chown -R ubuntu:ubuntu /var/www/application/wanderlust
chmod -R 755 /var/www/application/wanderlust

echo "Backend setup completed"
