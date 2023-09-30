# Makefile for Docker management

# Variables
DC := docker-compose

.PHONY: run restart stop

# Start the Docker containers
up:
	$(DC) build
	$(DC) up -d

# Restart the Docker containers
restart:
	$(DC) restart

pull:
	docker pull ghcr.io/chozandrias76/world-generator

# Show the logs of the web container
logs:
	$(DC) logs --follow web

# Stop the Docker containers
down:
	$(DC) down
