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

rspec:
	$(DC) exec -e RAILS_ENV=test web bundle exec rspec

api:
	$(DC) exec -e RAILS_ENV=test web bin/rails rswag

lint-ruby:
	$(DC) exec web bundle exec rubocop \
	--require rubocop-rails --require rubocop-performance \
	-A \
	spec/**/**/*.rb \
	app/services/**/*.rb \
	app/models/**/*.rb \
	config/**/*.rb

bundle:
	$(DC) exec web bundle

# Show the logs of the web container
logs:
	$(DC) logs --follow web

# Stop the Docker containers
down:
	$(DC) down
