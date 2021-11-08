#!make

PROJECT_ID		:= PUT_ID_HERE
PROJECT_NAME	:= app
PROJECT_DIR		:= ${CURDIR}/app
GCLOUD_VERSION	:= 2021
HEROKU_PROJECT	:= financeiro-di-persona

install:
	@echo "Verifying python environment"
	test -d .venv || python3 -m venv .venv
	@echo "Installing packages"
	( \
		source .venv/bin/activate && \
		pip install --upgrade pip \
		pip install -r requirements.txt \
	)

collectstatic:
	./manage.py collectstatic

models:
	./manage.py makemigrations && ./manage.py migrate
	
run:
	./manage.py runserver 0.0.0.0:8000 
	
test:
	./manage.py test

admin:
	./manage.py createsuperuser

create-admin:
	./manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'alexiuasse+admindpf@gmail.com', 'admin123')"

makemessages:
	django-admin makemessages -l pt_BR

compilemessages:
	django-admin compilemessages

heroku-install:
	heroku run -a $(HEROKU_PROJECT) python manage.py migrate
	heroku run -a $(HEROKU_PROJECT) python manage.py create_groups

heroku-migrate:
	heroku run -a $(HEROKU_PROJECT) python manage.py migrate

heroku-create-admin:
	heroku run python manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'alexiuasse+adminfdp@gmail.com', '4dm1n!@#')"

heroku-logs:
	heroku logs -a $(HEROKU_PROJECT) --tail

gcloud-setcors:
	gsutil cors set cors.json gs://japachips-static

gcloud-config:
	gcloud config set project $(PROJECT_ID)

gcloud-deploy:
	gcloud app deploy --version=$(GCLOUD_VERSION)

gcloud-logs:
	gcloud app logs tail