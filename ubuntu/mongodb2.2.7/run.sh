#!/bin/bash

MONGODB_USER=${MONGODB_USER:-"admin"}
MONGODB_PASS=${MONGODB_PASS:-"mongo"}
MONGODB_DB=${MONGODB_DB:-"mongo"}

if [ ! -f /data/db/mongodb_root_init ]
then
	echo "Configuring ${MONGODB_USER} as 'root' role..."
	/opt/mongodb/bin/mongod --fork --logpath /var/log/mongodb.log
	mongo admin --eval 'db.addUser("'"${MONGODB_USER}"'", "'"${MONGODB_PASS}"'", false );'

	echo "Configuring permissions for ${MONGODB_USER} on ${MONGODB_DB}..."
	mongo ${MONGODB_DB} --eval 'db.addUser("'"${MONGODB_USER}"'", "'"${MONGODB_PASS}"'", false )'

	# shut down mongodb
	mongo admin --eval 'db.shutdownServer();'

	touch /data/db/mongodb_root_init

	echo "Waiting for mongodb to shutdown"
	while [ -s /data/db/mongod.lock ]
	do
		echo -ne "."
		sleep .05
	done
	echo -ne "done\n\n"
fi

/opt/mongodb/bin/mongod --rest --auth
