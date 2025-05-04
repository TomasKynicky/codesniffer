# Code Sniffer

## Použití

docker-compose.yml

```yaml
services:

  code-sniffer:
    image: img-name
    volumes:
      - ./../:/code:delegated
    profiles:
      - donotstart
```

Makefile

```Makefile
cs:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) run --rm code-sniffer code-sniffer
```
