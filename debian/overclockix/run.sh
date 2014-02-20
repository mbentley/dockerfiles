#!/bin/bash

action=${1:-}
aptproxy=${aptproxy:-}

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
		/opt/live/overclockix/i386_iso-hybrid/build.sh "${aptproxy}"
		/opt/live/overclockix/i386_usb-hdd/build.sh "${aptproxy}"
		/opt/live/overclockix/amd64_iso-hybrid/build.sh "${aptproxy}"
		/opt/live/overclockix/amd64_usb-hdd/build.sh "${aptproxy}"
		;;
	buildi386)
		/opt/live/overclockix/i386_iso-hybrid/build.sh "${aptproxy}"
		/opt/live/overclockix/i386_usb-hdd/build.sh "${aptproxy}"
		;;
	buildamd64)
		/opt/live/overclockix/amd64_iso-hybrid/build.sh "${aptproxy}"
		/opt/live/overclockix/amd64_usb-hdd/build.sh "${aptproxy}"
		;;
	buildi386_iso-hybrid)
		/opt/live/overclockix/i386_iso-hybrid/build.sh "${aptproxy}"
		;;
	buildi386_usb-hdd)
		/opt/live/overclockix/i386_usb-hdd/build.sh "${aptproxy}"
		;;
	buildamd64_iso-hybrid)
		/opt/live/overclockix/amd64_iso-hybrid/build.sh "${aptproxy}"
		;;
	buildamd64_usb-hdd)
		/opt/live/overclockix/amd64_usb-hdd/build.sh "${aptproxy}"
		;;
	bash|*)
		/bin/bash
		;;
esac
