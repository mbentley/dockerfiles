mbentley/ubuntu-ums
==================

docker image for Universal Media Server (UMS)
based off of stackbrew/ubuntu:14.04

To pull this image:
`docker pull mbentley/ubuntu-ums`

Example usage:
`docker run -i -t -p 5001:5001 -v /data/media:/path/to/your/media mbentley/ubuntu-ums`
