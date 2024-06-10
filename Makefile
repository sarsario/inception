all:
	@sudo hostsed add 127.0.0.1 osarsari.42.fr && echo "osarsari.42.fr added to /etc/hosts"
	sudo docker compose -f srcs/docker-compose.yml up -d --build
	@echo "Containers are up and running"

# sudo docker compose -f srcs/docker-compose.yml down --rmi all -v
# docker network rm $$(docker network ls -q);
clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	@echo "Containers are down"

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
	sudo docker ps -a

.PHONY: all clean fclean re