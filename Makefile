build:
	docker-compose build

install:
	docker-compose run --rm demo-app poetry install

up:
	docker-compose up

up-build:
	docker-compose up --build

down:
	docker-compose down

test:
	make install
	docker-compose run --rm demo-app poetry run pytest tests

lint:
	make install
	docker-compose run --rm demo-app \
	poetry run flake8 tests api && \
	poetry run isort --check --diff tests api && \
	poetry run black --check tests api && \
	poetry run mypy tests api

format:
	make install
	docker-compose run --rm demo-app \
	poetry run isort tests api && \
	poetry run black tests api
