#!/bin/bash

cd /opt/live

if [ ! -d /opt/live/overclockix ]
then
	git clone https://github.com/mbentley/overclockix.git
else
	cd overclockix
	git pull
fi

/opt/live/overclockix/scripts/create_hard_links

bash
