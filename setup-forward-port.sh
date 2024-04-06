#!/bin/bash

# Install NGINX
sudo apt update
sudo apt install nginx -y

echo "-----------------Your domain/sub domain name(abc.com or api.abc.com): "
read domain

echo "-----------------Path to your build folder: "
read source_path

echo "-----------------Your service port: "
read port

# Domain configuration
echo "server {
    listen 80;
    server_name $domain;

    location / {
        proxy_pass http://localhost:$port;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}" | sudo tee /etc/nginx/sites-available/$domain > /dev/null

sudo ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/

# Check
sudo nginx -t

# Reload
sudo systemctl reload nginx

# Install Certbot
sudo apt install certbot python3-certbot-nginx -y

# Make a new Let's Encrypt
sudo certbot --nginx -d $domain