PROJECT_NAME := project-code-sniffer
COMPOSE_FILE := .devstack/docker-compose.yml

cs:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) run --rm code-sniffer code-sniffer

cs-fix:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) run --rm code-sniffer code-sniffer --fix
