#!/bin/bash
set -e

POSTGRESQL_USER=${POSTGRESQL_USER:-"docker"}
POSTGRESQL_PASS=${POSTGRESQL_PASS:-"docker"}
POSTGRESQL_DB=${POSTGRESQL_DB:-"docker"}

POSTGRESQL_BIN_PATH=/usr/lib/postgresql/9.3/bin
POSTGRESQL_CONFIG_FILE=/etc/postgresql/9.3/main/postgresql.conf

POSTGRESQL_DATA=/data
POSTGRESQL_CFGDIR=/etc/postgresql/9.3/main
POSTGRESQL_DBDIR=/var/lib/postgresql/9.3/main

chmod 755 ${POSTGRESQL_DATA}

if [ ! -d "${POSTGRESQL_DATA}/db" ]
then
	echo "no data; moving..."
	mkdir -p ${POSTGRESQL_DATA}/db
	mv ${POSTGRESQL_DBDIR} ${POSTGRESQL_DATA}/db
	ln -s ${POSTGRESQL_DATA}/db/main ${POSTGRESQL_DBDIR}
	chown -R postgres:postgres ${POSTGRESQL_DATA}/db
else
	echo "using existing data..."
	rm -rf ${POSTGRESQL_DBDIR}
	ln -s ${POSTGRESQL_DATA}/db/main ${POSTGRESQL_DBDIR}
fi

if [ ! -d "${POSTGRESQL_DATA}/cfg" ]
then
	echo "no config; moving..."
	mkdir -p ${POSTGRESQL_DATA}/cfg
	mv ${POSTGRESQL_CFGDIR} ${POSTGRESQL_DATA}/cfg
	ln -s ${POSTGRESQL_DATA}/cfg/main ${POSTGRESQL_CFGDIR}
	chown -R postgres:postgres ${POSTGRESQL_DATA}/cfg

	sudo -u postgres $POSTGRESQL_BIN_PATH/postgres --single --config-file=$POSTGRESQL_CONFIG_FILE <<< "CREATE USER $POSTGRESQL_USER WITH SUPERUSER;"
	sudo -u postgres $POSTGRESQL_BIN_PATH/postgres --single --config-file=$POSTGRESQL_CONFIG_FILE <<< "ALTER USER $POSTGRESQL_USER WITH PASSWORD '$POSTGRESQL_PASS';"
	sudo -u postgres $POSTGRESQL_BIN_PATH/postgres --single --config-file=$POSTGRESQL_CONFIG_FILE <<< "CREATE DATABASE $POSTGRESQL_DB OWNER $POSTGRESQL_USER;"
	echo 'host all all 0.0.0.0/0 md5' >> /etc/postgresql/9.3/main/pg_hba.conf
else
	echo "using existing config..."
	rm -rf ${POSTGRESQL_CFGDIR}
	ln -s ${POSTGRESQL_DATA}/cfg/main ${POSTGRESQL_CFGDIR}
fi

/usr/bin/supervisord
