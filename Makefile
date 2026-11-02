NAME := inception

COMPOSE_FILE := srcs/docker-compose.yml
DOCKER_COMPOSE := docker compose -f $(COMPOSE_FILE)

SERVICES := mariadb nginx wordpress

.PHONY: all build up start down stop restart logs ps clean fclean re help

all: up

## Build les images de chaque service
build:
	@for service in $(SERVICES); do \
		echo "Building image: $$service"; \
		docker build -t $$service:1.0 srcs/requirements/$$service; \
	done

## Build puis lance les conteneurs en arrière-plan
up: build
	$(DOCKER_COMPOSE) up -d

## Alias plus explicite pour lancer le projet
start: up

## Stoppe et supprime les conteneurs, mais garde les images et volumes
down:
	$(DOCKER_COMPOSE) down

## Stoppe les conteneurs sans les supprimer
stop:
	$(DOCKER_COMPOSE) stop

## Redémarre les conteneurs
restart:
	$(DOCKER_COMPOSE) restart

## Affiche les logs de tous les services
logs:
	$(DOCKER_COMPOSE) logs -f

## Affiche l'état des conteneurs
ps:
	$(DOCKER_COMPOSE) ps

## Supprime conteneurs, réseaux et volumes
clean:
	$(DOCKER_COMPOSE) down -v --remove-orphans

## Supprime aussi les images construites par le projet
fclean: clean
	@for service in $(SERVICES); do \
		docker rmi -f $$service:1.0 2>/dev/null || true; \
	done

## Clean puis rebuild + relance
re: fclean up

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "  all      Build images and start containers"
	@echo "  build    Build Docker images for all services"
	@echo "  up       Build and start containers in detached mode"
	@echo "  down     Stop and remove containers"
	@echo "  stop     Stop containers without removing them"
	@echo "  restart  Restart containers"
	@echo "  logs     Follow logs from all containers"
	@echo "  ps       Show container status"
	@echo "  clean    Remove containers, networks and volumes"
	@echo "  fclean   Remove containers, networks, volumes and project images"
	@echo "  re       Full clean, rebuild and restart"
