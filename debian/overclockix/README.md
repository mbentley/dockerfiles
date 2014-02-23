mbentley/debian-overclockix
==================

docker image for building Overclockix on Debian Wheezy

To pull this image:
`docker pull mbentley/debian-overclockix`

Example usage:
```
docker run -privileged -i -t -e aptproxy=http://192.168.56.2:3142 \
   -v /opt/live:/opt/live mbentley/debian-overclockix build all
```

You can specify how you would like to launch the build environment:

`bash` or no argument - Starts a bash session inside the container

`build all` - Builds all flavors & image types

`build i386` - Builds all i386 images

`build amd64` - Builds all amd64 images

`build i386_iso-hybrid` - Builds i386; iso-hybrid

`build i386_usb-hdd` - Builds i386; usb-hdd

`build amd64_iso-hybrid` - Builds amd64; iso-hybrid

`build amd64_usb-hdd` - Builds amd64; usb-hdd

There is also an environment variable you may specify for configuring live-build to use a proxy (like apt-cacher-ng)

`aptproxy` - Defaults to none

*Note:* You must run the container with the `-privileged` argument for debootstrap to work.
