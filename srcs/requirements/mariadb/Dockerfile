FROM debian:buster

EXPOSE 3306

# Update/Upgrade apt-get
RUN apt-get update && apt-get upgrade -y

# Install MariaDB
RUN apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

# Copy the configuration file
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script to create the database
COPY tools/script.sh /
RUN bash ./script.sh
RUN rm -rf ./script.sh

# Start the service
CMD [ "mysqld_safe" ]