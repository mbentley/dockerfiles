FROM mbentley/ubuntu-base
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN apt-get install -y nginx supervisor

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD run.sh /usr/local/bin/run

CMD ["/usr/local/bin/run"]
