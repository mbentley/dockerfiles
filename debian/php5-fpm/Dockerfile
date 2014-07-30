FROM stackbrew/debian:jessie
MAINTAINER Matt Bentley <mbentley@mbentley.net>
RUN (echo "deb http://http.debian.net/debian/ jessie main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list)
RUN apt-get update

RUN apt-get install php5-fpm -y
RUN sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 9000/g' /etc/php5/fpm/pool.d/www.conf
RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf

EXPOSE 9000
CMD ["/usr/sbin/php5-fpm","-R","--fpm-config","/etc/php5/fpm/php-fpm.conf"]
