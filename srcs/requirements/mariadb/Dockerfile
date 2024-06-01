FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

# Copy the configuration file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script to create the database
COPY tools/create_db.sh /create_db.sh

# Run the script to create the database
RUN chmod +x /create_db.sh
RUN /create_db.sh