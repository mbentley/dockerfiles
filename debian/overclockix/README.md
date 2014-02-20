mbentley/debian-overclockix
==================

docker image for building Overclockix on Debian Wheezy

To pull this image:
`docker pull mbentley/debian-overclockix`

Example usage:
`docker run -privileged -i -t -e apt-proxy=http://acng.casa.mbentley.net -v /data/live:/opt/live mbentley/debian-overclockix bash`

You can specify how you would like to launch the build environment:

`bash` - Starts a bash session inside the container

`buildall` - Builds all flavors

`buildi386` - Builds all i386 images

`buildamd64` - Builds all amd64 images

`buildi386_iso-hybrid` - Builds i386; iso-hybrid

`buildi386_usb-hdd` - Builds i386; usb-hdd

`buildamd64_iso-hybrid` - Builds amd64; iso-hybrid

`buildamd64_usb-hdd` - Builds amd64; usb-hdd

There is also an environment variable you may specify for configuring live-build to use a proxy (like apt-cacher-ng)

`apt-proxy` - Defaults to none

*Note:* You must run the container with the `-privileged` argument for debootstrap to work.
