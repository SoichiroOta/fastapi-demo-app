build:
	docker-compose build

update:
		docker-compose run --rm demo-app poetry update

install:
	docker-compose run --rm demo-app poetry install

up:
	docker-compose up

up-build:
	docker-compose up --build

down:
	docker-compose down

db-migrate:
	docker-compose exec demo-app poetry run python -m api.migrate_db

test:
	make install
	docker-compose run --rm demo-app poetry run pytest --cov=api tests

lint:
	make install
	docker-compose run --rm demo-app poetry run flake8 tests api
	docker-compose run --rm demo-app poetry run isort --check --diff tests api
	docker-compose run --rm demo-app poetry run black --check tests api
	docker-compose run --rm demo-app poetry run mypy tests api

format:
	make install
	docker-compose run --rm demo-app poetry run isort tests api
	docker-compose run --rm demo-app poetry run black tests api
