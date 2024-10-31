#!/bin/bash

sudo apt-get update
sudo apt-get install -y apache2 php libapache2-mod-php php-mysql git
sudo apt install net-tools
sudo systemctl enable apache2
git clone https://github.com/josejuansanchez/iaw-practica-lamp.git /var/www/practicalamp/



sudo chown -R www-data.www-data /var/www/practicalamp/

sudo sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/practicalamp|' /etc/apache2/sites-available/lamp.conf

cd /etc/apache2/sites-available
sudo a2ensite lamp.conf
cd /etc/apache2/sites-enabled
sudo a2dissite 000-default.conf


cat <<EOL > /var/www/practicalamp/config.php
<?php

define('DB_HOST', '192.168.56.11');
define('DB_USER', 'carlos');
define('DB_PASSWORD', 'S1234?');
define('DB_NAME', 'lamp_db');

\$mysqli = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

?>
EOL

sudo systemctl reload apache2
