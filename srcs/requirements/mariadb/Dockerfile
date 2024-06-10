FROM debian:buster

EXPOSE 3306

RUN apt-get update

# Install MariaDB
RUN apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

# Copy the configuration file
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script to create the database
COPY tools/create_db.sh /
RUN bash ./create_db.sh
RUN rm -rf ./create_db.sh

# Start the service
CMD [ "mysqld_safe" ]