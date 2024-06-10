all:
	@sudo hostsed add 127.0.0.1 osarsari.42.fr && echo "osarsari.42.fr added to /etc/hosts"
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build
	@echo "Containers are up and running"

clean:
	@sudo docker compose -f ./srcs/docker-compose.yml stop
	@sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	@echo "Containers are down"
	@sudo docker system prune -a

fclean: clean
	@sudo hostsed rm 127.0.0.1 osarsari.42.fr && echo "osarsari.42.fr removed from /etc/hosts"
	@if [ -d "/home/osarsari/data/wordpress" ]; then \
	sudo rm -rf /home/osarsari/data/wordpress/* && echo "Wordpress data removed"; \
	fi;

	@if [ -d "/home/osarsari/data/mariadb" ]; then \
	sudo rm -rf /home/osarsari/data/mariadb/* && echo "MariaDB data removed"; \
	fi;

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all clean fclean re