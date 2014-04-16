#!/bin/bash

MONGODB_USER=${MONGODB_USER:-"admin"}
MONGODB_PASS=${MONGODB_PASS:-"mongo"}

if [ ! -f /data/db/.mongo_root_init ]
then
	echo "Configuring ${MONGODB_USER} as 'root' role..."
	/opt/mongodb/bin/mongod --fork --logpath /var/log/mongodb.log
	mongo admin --eval 'db.createUser({user: "'"${MONGODB_USER}"'", pwd: "'"${MONGODB_PASS}"'", roles: [ "root" ]});'
	mongo admin --eval 'db.shutdownServer();'
	touch /data/db/.mongo_root_init
fi

/usr/bin/supervisord
