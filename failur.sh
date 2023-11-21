#!/bin/bash

#!/bin/bash

# Ask questions
echo "nginx install(yes/no)"
read -p "Enter your choice: " choice

if [[ $choice == "yes" ]]; then
  echo "Installing nginx..."
  # Install nginx
else
  echo "Skipping nginx installation."
fi

echo "php install(select version(7.4 or 8.0))"
read -p "Enter your choice: " choice

case $choice in
  7.4)
    echo "Installing PHP 7.4..."
    # Install PHP 7.4
    ;;
  8.0)
    echo "Installing PHP 8.0..."
    # Install PHP 8.0
    ;;
  *)
    echo "Invalid choice. Skipping PHP installation."
    ;;
esac

echo "phpmyadmin(yes/no)"
read -p "Enter your choice: " choice

if [[ $choice == "yes" ]]; then
  echo "Installing phpMyAdmin..."
  # Install phpMyAdmin
else
  echo "Skipping phpmyadmin installation."
fi

echo "mysql(yes/no)"
read -p "Enter your choice: " choice

if [[ $choice == "yes" ]]; then
  echo "Installing MySQL..."
  # Install MySQL
else
  echo "Skipping mysql installation."
fi

echo "certbot(yes/no)"
read -p "Enter your choice: " choice

if [[ $choice == "yes" ]]; then
  echo "Installing certbot..."
  # Install certbot
else
  echo "Skipping certbot installation."
fi

# Install software
if [[ $choice == "yes" ]]; then
  echo "Installing nginx..."
  sudo apt-get update
  sudo apt-get install nginx -y

  echo "Installing PHP 7.4..."
  sudo apt-get update
  sudo apt-get install php7.4 php7.4-fpm php7.4-common php7.4-mysql php7.4-cli -y

  echo "Installing PHP 8.0..."
  sudo apt-get update
  sudo apt-get install php8.0 php8.0-fpm php8.0-common php8.0-mysql php8.0-cli -y

  echo "Installing MySQL..."
  sudo apt-get update
  sudo apt-get install mariadb-server mariadb-client -y

  echo "Installing phpMyAdmin..."
  wget -O /tmp/phpMyAdmin.deb https://www.phpmyadmin.net/downloads/phpMyAdmin_latest_all.deb
  sudo dpkg -i /tmp/phpMyAdmin.deb
  sudo apt-get install -y phpmyadmin/phpmyadmin-common

  echo "Installing certbot..."
  sudo apt-get update
  sudo apt-get install certbot -y

  # Restart nginx and phpMyAdmin
  echo "Restarting nginx and phpMyAdmin..."
  sudo service nginx restart
  sudo service phpmyadmin restart

  echo "All installations completed!"
else
  echo "No installations completed."
fi
