#!/bin/bash
echo "Setting up Wanderlust frontend..."
cd /var/www/wanderlust-frontend

# Install nginx if not installed
if ! command -v nginx &> /dev/null; then
    echo "Installing nginx..."
    yum update -y
    yum install -y nginx
    systemctl start nginx
    systemctl enable nginx
fi

# Create nginx configuration
echo "Configuring nginx..."
cat > /etc/nginx/conf.d/wanderlust.conf << 'EOL'
server {
    listen 80;
    server_name _;
    root /var/www/wanderlust-frontend;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
EOL

# Restart nginx
systemctl restart nginx
echo "Frontend setup completed!"
