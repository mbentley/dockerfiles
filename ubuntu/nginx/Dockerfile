FROM stackbrew/ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>
RUN (echo "deb http://archive.ubuntu.com/ubuntu/ precise main restricted universe multiverse" > /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-updates main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-security main restricted universe multiverse" >> /etc/apt/sources.list)
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

ADD default /etc/nginx/sites-available/default
RUN mkdir -p /var/www

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

VOLUME ["/var/log/nginx", "/var/www"]
EXPOSE 80
CMD ["nginx","-c","/etc/nginx/nginx.conf"]
