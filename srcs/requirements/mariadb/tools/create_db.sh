#!/bin/bash

service mysql start

ARG DB_NAME=$DB_NAME
ARG DB_USER=$DB_USER
ARG DB_PASSWORD=$DB_PASSWORD
ARG DB_ROOT_PASSWORD=$DB_ROOT_PASSWORD

mysql -e "CREATE DATABASE IF NOT EXISTS '${DB_NAME}';"
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON '${DB_NAME}'.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown

exec mysqld_safe