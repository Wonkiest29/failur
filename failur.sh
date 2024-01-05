#!/bin/bash

# Update and upgrade packages
apt-get update 
apt-get upgrade 

# Install Nginx and PHP-FPM
apt install nginx 
apt install php7.4-fpm

# Remove default Nginx configuration
rm /etc/nginx/sites-enabled/default 

# Configure Nginx with PHP
echo "server {
    listen 80;
    root /var/www/html;

    index index.php;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}" > /etc/nginx/sites-enabled/default
nginx -t
# Install MySQL Server
apt install mysql-server

# Install phpMyAdmin
apt install phpmyadmin
ln -s /usr/share/phpmyadmin /var/www/html
