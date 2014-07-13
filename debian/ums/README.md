mbentley/debian-ums
==================

docker image for Universal Media Server (UMS)
based off of stackbrew/debian:wheezy

To pull this image:
`docker pull mbentley/debian-ums`

Example usage:
`docker run -i -t --net="host" -p 5001:5001 -v /data/media:/path/to/your/media --name ums mbentley/debian-ums`
