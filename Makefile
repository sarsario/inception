(all):
	@sudo docker compose -f srcs/docker-compose.yml up --build

clean:
	@sudo docker compose -f srcs/docker-compose.yml down

fclean: clean
	@sudo docker rmi -f $$(docker images -a -q)
	@sudo docker volume rm $$(docker volume ls -q)
	@sudo docker system prune -af --volumes
	@sudo docker network rm $$(docker network ls -q)

re: fclean all

.PHONY: all clean fclean re