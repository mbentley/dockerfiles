FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y supervisor nginx-full uwsgi uwsgi-plugin-python

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD nginx-config.conf /etc/nginx/sites-enabled/example.conf
RUN rm /etc/nginx/sites-enabled/default

RUN mkdir -p /var/www/example/public_html/static
RUN mkdir  /var/www/example/application
RUN mkdir  /var/www/example/logs
ADD example.xml /etc/uwsgi/apps-available/example.xml
RUN ln -s /etc/uwsgi/apps-available/example.xml /etc/uwsgi/apps-enabled/example.xml

ADD wsgi_configuration_module.py /var/www/example/application/wsgi_configuration_module.py

EXPOSE 80
CMD ["/usr/bin/supervisord"]
