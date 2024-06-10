#!bin/bash
sleep 10

if [ ! -f /var/www/wordpress/wp-config.php ];
then
	wp config create \
		--allow-root \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--dbhost=mariadb:3306 --path='/var/www/wordpress'

	wp core install \
		--allow-root \
		--url=$WP_URL \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_MAIL

	wp user create $WP_USER $WP_USER_MAIL \
		--role=author \
		--user_pass=$WP_USER_PASSWORD \
		--allow-root
fi

php-fpm7.3 -F

# cd /var/www/wordpress
# wp core config	--dbhost=$DB_HOST \
# 				--dbname=$DB_NAME \
# 				--dbuser=$DB_USER \
# 				--dbpass=$DB_PASSWORD \
# 				--allow-root

# wp core install --title=$WP_TITLE \
# 				--admin_user=$WP_ADMIN_USER \
# 				--admin_password=$WP_ADMIN_PASSWORD \
# 				--admin_email=$WP_ADMIN_MAIL \
# 				--url=$WP_URL \
# 				--allow-root

# wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
# cd -

# php-fpm7.3 -F