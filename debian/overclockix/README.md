mbentley/debian-overclockix
==================

docker image for building Overclockix on Debian Wheezy

To pull this image:
`docker pull mbentley/debian-overclockix`

Example usage:
`docker run -privileged -i -t -v /data/live:/opt/live mbentley/debian-overclockix`

*Note:* You must run the container with the `-privileged` argument for debootstrap to work.
