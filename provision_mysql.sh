#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y mysql-server 
sudo service mysql start
sudo apt install net-tools
sudo git clone https://github.com/josejuansanchez/iaw-practica-lamp.git 

sudo su

mysql -u root < iaw-practica-lamp/db/database.sql



mysql -u root <<EOF
CREATE USER 'carlos'@'192.168.56.10' IDENTIFIED BY 'S1234?';
GRANT ALL PRIVILEGES ON lamp_db.* TO 'carlos'@'192.168.56.10';
FLUSH PRIVILEGES;
EOF



sudo sed -i 's/^bind-address\s*=.*/bind-address = 192.168.56.11/' /etc/mysql/mysql.conf.d/mysqld.cnf

sudo systemctl restart mysql

