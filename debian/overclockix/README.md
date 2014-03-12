mbentley/debian-overclockix
==================

docker image for building Overclockix on Debian Wheezy

To pull this image:
`docker pull mbentley/debian-overclockix`

Example usage:
```
docker run --privileged -i -t -e aptproxy=http://192.168.56.2:3142 \
   -e branch=master -v /opt/live:/opt/live mbentley/debian-overclockix build all
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


There are also environment variables you may specify:

`aptproxy` - configures live-build to use an apt- proxy (defaults - none)

`branch` - specifies which branch of [Overclockix](https://github.com/mbentley/overclockix) you would like to build (default - master)

*Note:* You must run the container with the `--privileged` argument for debootstrap to work.
