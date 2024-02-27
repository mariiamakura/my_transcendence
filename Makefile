
all:
# builds and runs the containers
	docker compose -f docker-compose.yml up --build -d

clean:
# stops and removes the containers
	docker compose -f docker-compose.yml down --rmi all -v

down:
# stops the containers
	docker compose -f docker-compose.yml down

up:
# starts the containers
	docker compose -f docker-compose.yml up -d
	
restart:
# stops and starts the containers
	docker compose -f docker-compose.yml down
	docker compose -f docker-compose.yml up -d

fclean: clean
# removes all the images
	@docker system prune -a

re: down all
# stops the containers, removes the images, builds and runs the containers
	@echo "restarting the containers"
