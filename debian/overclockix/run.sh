#!/bin/bash

action=${1:-}
apt-proxy=${apt-proxy:-}

cd /opt/live

if [ ! -d /opt/live/overclockix ]
then
	git clone https://github.com/mbentley/overclockix.git
else
	cd overclockix
	git pull
fi

/opt/live/overclockix/scripts/create_hard_links

case $action in
	buildall)
		/opt/live/overclockix/i386_iso-hybrid/build.sh $proxy
		/opt/live/overclockix/i386_usb-hdd/build.sh $proxy
		/opt/live/overclockix/amd64_iso-hybrid/build.sh $proxy
		/opt/live/overclockix/amd64_usb-hdd/build.sh $proxy
		;;
	buildi386)
		/opt/live/overclockix/i386_iso-hybrid/build.sh $proxy
		/opt/live/overclockix/i386_usb-hdd/build.sh $proxy
		;;
	buildamd64)
		/opt/live/overclockix/amd64_iso-hybrid/build.sh $proxy
		/opt/live/overclockix/amd64_usb-hdd/build.sh $proxy
		;;
	buildi386_iso-hybrid)
		/opt/live/overclockix/i386_iso-hybrid/build.sh $proxy
		;;
	buildi386_usb-hdd)
		/opt/live/overclockix/i386_usb-hdd/build.sh $proxy
		;;
	buildamd64_iso-hybrid)
		/opt/live/overclockix/amd64_iso-hybrid/build.sh $proxy
		;;
	buildamd64_usb-hdd)
		/opt/live/overclockix/amd64_usb-hdd/build.sh $proxy
		;;
	bash|*)
		/bin/bash
		;;
esac
