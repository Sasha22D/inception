NAME := inception

COMPOSE_FILE := srcs/docker-compose.yml
DOCKER_COMPOSE := docker compose -f $(COMPOSE_FILE)

SERVICES := mariadb nginx wordpress

.PHONY: all build up start down stop restart logs ps clean fclean re help

all: up

build:
	@for service in $(SERVICES); do \
		echo "Building image: $$service"; \
		docker build -t $$service:1.0 srcs/requirements/$$service; \
	done

up: build
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

stop:
	$(DOCKER_COMPOSE) stop

restart:
	$(DOCKER_COMPOSE) restart

logs:
	$(DOCKER_COMPOSE) logs -f

ps:
	$(DOCKER_COMPOSE) ps

clean:
	$(DOCKER_COMPOSE) down -v --remove-orphans

fclean: clean
	@for service in $(SERVICES); do \
		docker rmi -f $$service:1.0 2>/dev/null || true; \
	done

re: fclean up

help:
	@echo "all      Build images and start containers"
	@echo "build    Build Docker images for all services"
	@echo "up       Build and start containers in detached mode"
	@echo "down     Stop and remove containers"
	@echo "stop     Stop containers without removing them"
	@echo "restart  Restart containers"
	@echo "logs     Follow logs from all containers"
	@echo "ps       Show container status"
	@echo "clean    Remove containers, networks and volumes"
	@echo "fclean   Remove containers, networks, volumes and project images"
	@echo "re       Full clean, rebuild and restart"
