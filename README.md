# Demo App

## Migrate DB

`docker-compose exec demo-app poetry run python -m api.migrate_db`

## Run test

`docker-compose exec demo-app poetry run pytest`
