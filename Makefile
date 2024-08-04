# Makefile
.PHONY: test
test:
	poetry run py src/poll_app/manage.py test --noinput polls

.PHONY: linting
linting:
	poetry run isort src
	poetry run black --line-length 120 src
	poetry run flake8 --ignore=E226,E302,E41,W191,W503 --max-complexity=13 --max-line-length=120 src

.PHONY: mypy
mypy:
	poetry run mypy src

.PHONY: run_server
run_server:
	poetry run py src/poll_app/manage.py runserver

.PHONY: migrate
migrate:
	poetry run py src/poll_app/manage.py migrate

.PHONY: make_migrations
make_migrations:
	poetry run py src/poll_app/manage.py makemigrations polls
