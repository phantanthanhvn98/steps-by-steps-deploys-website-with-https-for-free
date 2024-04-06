#!/bin/bash

# Install NGINX
sudo apt update
sudo apt install nginx -y

echo "-------------Your domain/sub domain name(abc.com or api.abc.com): "
read domain

echo "-------------Path to your build folder: "
read source_path
# Domain configuration
echo "server {
    listen 80;
    server_name $domain www.$domain;

    root $source_path;

    index index.html;

    location / {
        try_files $uri $uri/ =404;;
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
sudo certbot --nginx -d $domain -d www.$domain