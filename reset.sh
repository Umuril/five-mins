#!/bin/bash

##### CLEAN UP PHASE #####
python3 manage.py flush --noinput
rm -fr main/migrations
##### CLEAN UP PHASE #####

##### DJANGO PHASE #####
python3 manage.py makemigrations main
python3 manage.py makemigrations
python3 manage.py migrate
DJANGO_SUPERUSER_USERNAME=root \
DJANGO_SUPERUSER_PASSWORD=toor \
DJANGO_SUPERUSER_EMAIL="root@example.com" \
python3 manage.py createsuperuser --noinput
##### DJANGO PHASE #####

##### CUSTOM PHASE #####
python3 manage.py init
python3 manage.py create_user -n 10
python3 manage.py create_worker -n 10
python3 manage.py create_hand -n 10
##### CUSTOM PHASE #####