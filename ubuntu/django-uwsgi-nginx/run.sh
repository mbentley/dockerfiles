#!/bin/bash

if [ ! -f "/opt/django/app/manage.py" ]
then
	echo "creating basic django project"
	django-admin.py startproject website /opt/django/app/
fi

/usr/bin/supervisord
