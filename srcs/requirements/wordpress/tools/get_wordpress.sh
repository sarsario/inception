#!/bin/sh

if [ -f ./wp-config.php ]
then
    echo "Wordpress is already installed"
else
    wget https://wordpress.org/latest.tar.gz
    tar -xvf latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz
    rm -rf wordpress

    sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
    sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
    sed -i "s/password_here/$DB_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php
fi

exec "$@"