#!/bin/bash

# Update and upgrade packages
apt-get update 
apt-get upgrade 

# Install Nginx and PHP-FPM
apt-get install nginx 
apt-get install php8.1-fpm

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
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}" > /etc/nginx/sites-enabled/default
nginx -t
service nginx restart
# Install MySQL Server
apt-get install mysql-server
sudo mysql_secure_installation
# Install phpMyAdmin
apt-get install phpmyadmin
ln -s /usr/share/phpmyadmin /var/www/html

# !/bin/bash

# Fetch the latest version number from the phpMyAdmin GitHub releases page
#latest_version=$(curl -sL https://github.com/phpmyadmin/phpmyadmin/releases/latest | grep -oP 'tag/([0-9]+\.[0-9]+\.[0-9]+)' | grep -oP '([0-9]+\.[0-9]+\.[0-9]+)')

# Check if the latest version number is retrieved successfully
#if [ -n "$latest_version" ]; then
   # echo "Latest phpMyAdmin version available: $latest_version"
    
    # Construct the download URL for the latest version
   # download_url="https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-$latest_version-all-languages.zip"

    # Download the latest version
  #  echo "Downloading phpMyAdmin $latest_version..."
  #  wget "$download_url"
  #  
  #  # Unzip the downloaded file
  #  unzip "phpMyAdmin-$latest_version-all-languages.zip"
  #  mw phpMyAdmin-$latest_version-all-languages phpmyadmin
  #  mw /usr/share/phpmyadmin /usr/share/phpmyadminold
 #   mv phpmyadmin /usr/share/phpmyadmin
#    echo "Download and extraction complete."
#else
#    echo "Failed to retrieve the latest version of phpMyAdmin."
#fi


