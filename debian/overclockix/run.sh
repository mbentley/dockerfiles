#!/bin/bash

action=${1:-}
buildopts=${2:-}
aptproxy=${aptproxy:-}
branch=${branch:master}

#echo 'LB_MIRROR_BOOTSTRAP="http://ftp.debian.org/debian"' > /etc/live/build.conf
#echo 'LB_MIRROR_CHROOT="http://ftp.debian.org/debian"' >> /etc/live/build.conf
#echo 'LB_MIRROR_CHROOT_SECURITY="http://security.debian.org/"' >> /etc/live/build.conf
#echo 'LB_MIRROR_BINARY="http://ftp.debian.org/debian/"' >> /etc/live/build.conf
#echo 'LB_MIRROR_BINARY_SECURITY="http://security.debian.org/"' >> /etc/live/build.conf

cd /opt/live

if [ ! -d /opt/live/overclockix ]
then
	git clone https://github.com/mbentley/overclockix.git
	cd overclockix
	git checkout ${branch}
else
	cd overclockix
	git pull
	git checkout ${branch}
fi

/opt/live/overclockix/scripts/create_hard_links

case $action:$buildopts in
	build:all)
		/opt/live/overclockix/i386_iso-hybrid/build.sh "${aptproxy}"
		/opt/live/overclockix/i386_usb-hdd/build.sh "${aptproxy}"
		/opt/live/overclockix/amd64_iso-hybrid/build.sh "${aptproxy}"
		/opt/live/overclockix/amd64_usb-hdd/build.sh "${aptproxy}"
		;;
	build:i386)
		/opt/live/overclockix/i386_iso-hybrid/build.sh "${aptproxy}"
		/opt/live/overclockix/i386_usb-hdd/build.sh "${aptproxy}"
		;;
	build:amd64)
		/opt/live/overclockix/amd64_iso-hybrid/build.sh "${aptproxy}"
		/opt/live/overclockix/amd64_usb-hdd/build.sh "${aptproxy}"
		;;
	build:i386_iso-hybrid)
		/opt/live/overclockix/i386_iso-hybrid/build.sh "${aptproxy}"
		;;
	build:i386_usb-hdd)
		/opt/live/overclockix/i386_usb-hdd/build.sh "${aptproxy}"
		;;
	build:amd64_iso-hybrid)
		/opt/live/overclockix/amd64_iso-hybrid/build.sh "${aptproxy}"
		;;
	build:amd64_usb-hdd)
		/opt/live/overclockix/amd64_usb-hdd/build.sh "${aptproxy}"
		;;
	release:*)
		/opt/live/overclockix/scripts/cp_images_to_release ${buildopts}
		;;
	createtorrents:*)
		/opt/live/overclockix/scripts/create_torrent_files ${buildopts}
	bash:*)
		/bin/bash
		;;
	*:*)
		echo "Invalid build argument specified"
		echo "Usage: $0 {build|bash} {all|i386|amd64|i386_iso-hybrid|i386_usb-hdd|amd64_iso-hybrid|amd64_usb-hdd}"
		exit 1
		;;
esac
