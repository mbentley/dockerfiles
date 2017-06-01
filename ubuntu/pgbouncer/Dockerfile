FROM ubuntu
MAINTAINER Matt Bentley <mbentley@mbentley.net> and Gaurang Vyas <gdvyas@gmail.com>

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        automake \
        build-essential \
        ca-certificates \
        git \
        libc-ares2 \
        libc-ares-dev \
        libev4 \
        libev-dev \
        libevent-2.0-5 \
        libevent-dev \
        libssl1.0.0 \
        libssl-dev \
        libtool \
        pkg-config \
        wget \
    && mkdir -p /opt && cd /opt \
    && git clone https://github.com/pgbouncer/pgbouncer.git \
    && cd /opt/pgbouncer \
    && git checkout pgbouncer_1_7_2 \
    && git submodule init \
    && git submodule update \
    && ./autogen.sh \
    && ./configure --enable-evdns=no \
    && make \
    && make install \
    && apt-get remove -y \
        automake \
        build-essential \
        ca-certificates \
        git \
        libc-ares-dev \
        libev-dev \
        libevent-dev \
        libssl-dev \
        libtool \
        pkg-config \
        wget \
    && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/pgbouncer/ \
    && mkdir -p /var/run/postgresql/ \
    && mkdir -p /var/log/postgresql/ \
    && groupadd --system postgres \
    && useradd -g postgres postgres \
    && touch /var/log/postgresql \
    && chown postgres:postgres /var/log/postgresql \
    && chown postgres:postgres /var/run/postgresql

ENV PG_ENV_POSTGRESQL_MAX_CLIENT_CONN 10000
ENV PG_ENV_POSTGRESQL_DEFAULT_POOL_SIZE 400
ENV PG_ENV_POSTGRESQL_SERVER_IDLE_TIMEOUT 240
ENV PG_ENV_POSTGRESQL_POOL_MODE session
ADD run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run
EXPOSE 6432
CMD ["/usr/local/bin/run"]
