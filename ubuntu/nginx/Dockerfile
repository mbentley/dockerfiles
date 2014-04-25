FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

ADD default /etc/nginx/sites-available/default
RUN mkdir -p /var/www

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

VOLUME ["/var/log/nginx", "/var/www"]
EXPOSE 80
CMD ["nginx","-c","/etc/nginx/nginx.conf"]
