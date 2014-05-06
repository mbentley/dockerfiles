FROM stackbrew/ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>
RUN (echo "deb http://archive.ubuntu.com/ubuntu/ precise main restricted universe multiverse" > /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-updates main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-security main restricted universe multiverse" >> /etc/apt/sources.list)
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libxslt-dev libxml2-dev libpq-dev postgresql-client libsqlite3-dev unzip wget autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev
 
# Install ruby.
# Solution from: http://stackoverflow.com/a/16224372
RUN wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p451.tar.gz -O /tmp/ruby-2.0.0-p451.tar.gz
RUN tar -xzf /tmp/ruby-2.0.0-p451.tar.gz
RUN  (cd ruby-2.0.0-p451/ && ./configure --disable-install-doc && make && make install) && \
    rm -rf ruby-2.0.0-p451/ && \
    rm -f /tmp/ruby-2.0.0-p451.tar.gz
 
RUN gem install bundler rails --no-rdoc --no-ri

RUN (wget --no-check-certificate https://github.com/rbCAS/CASinoApp/archive/master.zip -O /opt/CASino.zip)
RUN (cd /opt && unzip CASino.zip)
RUN mv /opt/CASinoApp-master /opt/CASino

ENV RAILS_ENV development
ADD cas.yml /opt/CASino/config/cas.yml
ADD database.yml /opt/CASino/config/database.yml

WORKDIR /opt/CASino
RUN bundle install --deployment --without test production mysql
RUN bundle exec rake db:schema:load
RUN bundle exec rake assets:precompile

CMD ["rails","s"]
