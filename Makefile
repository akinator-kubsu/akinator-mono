# Makefile for Akinator project

###############################################################################
# • globals
###############################################################################
export COMPOSE_DOCKER_CLI_BUILD := 1
export DOCKER_BUILDKIT         := 1
export COMPOSE_BAKE           := true

SERVICES        := akinator-api
COMPOSE_FILE    := compose.yaml
DEFAULT_BRANCH  := main

COMPOSE_PATH = $(shell pwd)/$(COMPOSE_FILE)

###############################################################################
# • help-центр ##
###############################################################################
help: ## Показать меню с целями
	@echo '\n\033[1m• Доступные цели\033[0m'; \
	 grep -E '^[a-zA-Z_-]+:.*?##' $(MAKEFILE_LIST) | \
	 awk 'BEGIN{FS=":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1,$$2}'; \
	 echo

###############################################################################
# • compose up / down / rebuild ##
###############################################################################
%-run: ## docker compose up -d для $*
	docker compose -f $(COMPOSE_PATH) up -d

%-off: ## docker compose down --remove-orphans для $*
	docker compose -f $(COMPOSE_PATH) down --remove-orphans

%-re: ## Перезапустить $*
	@$(MAKE) $*-off && $(MAKE) $*-run

# • универсальные цели для одного сервиса
run: ## поднять указанный сервис (S=)
	@if [ -z "$(S)" ]; then echo '✖ укажите сервис: make run S='; exit 1; fi
	@$(MAKE) $(S)-run

off: ## остановить указанный сервис (S=)
	@if [ -z "$(S)" ]; then echo '✖ укажите сервис: make off S='; exit 1; fi
	@$(MAKE) $(S)-off

%-build: ## пересобрать образ для $*
	docker compose -f $(COMPOSE_PATH) build $*

build: ## пересобрать указанный сервис (S=)
	@if [ -z "$(S)" ]; then echo '✖ укажите сервис: make build S='; exit 1; fi
	@$(MAKE) $(S)-build

rebuild: ## пересобрать и перезапустить указанный сервис (S=)
	@if [ -z "$(S)" ]; then echo '✖ укажите сервис: make rebuild S='; exit 1; fi
	@$(MAKE) $(S)-build && $(MAKE) $(S)-re

build-all: $(SERVICES:%=%-build) ## пересобрать все сервисы

up:   $(SERVICES:%=%-run) ## поднять все сервисы
down: $(SERVICES:%=%-off) ## остановить все сервисы
re:   down up             ## перезапуск всех сервисов

###############################################################################
# • логи ##
###############################################################################
logs-%:              ## tail ‑f логов выбранного сервиса
	docker compose -f $(COMPOSE_PATH) logs -f $*

logs:                ## tail ‑f логов всех сервисов
	@for s in $(SERVICES); do \
	   docker compose -f $(COMPOSE_PATH) logs -f $$s & \
	done; wait

###############################################################################
# • wipe / clean ##
###############################################################################
wipe: $(SERVICES:%=wipe-%) ## down‑v + orphan cleanup (DEV ⚠️)
wipe-%:
	docker compose -f $(COMPOSE_PATH) down -v --remove-orphans

clean: down ## down + удалить все тома и образы
	docker system prune -f --volumes

###############################################################################
# • development ##
###############################################################################
dev: ## Запустить проект в режиме разработки
	@$(MAKE) up
	@echo "• Проект запущен в режиме разработки"
	@echo "• API доступен по адресу: http://localhost:8080"

dev-stop: ## Остановить проект в режиме разработки
	@$(MAKE) down
	@echo "• Проект остановлен"

dev-rebuild: ## Пересобрать и перезапустить проект
	@$(MAKE) rebuild S=akinator-api
	@echo "• Проект пересобран и перезапущен"


artem:
	git config --global user.name "Artem-Darius Weber"
	git config --global user.email "mit.3tlasa@gmail.com"

sergey:
	git config --global user.name "Sergey Dudo"
	git config --global user.email "dudo@mail.ru"

meg:
	git config --global user.name "Meg-Lander"
	git config --global user.email "chertousov-vova@ya.ru"
