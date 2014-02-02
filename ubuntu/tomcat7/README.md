mbentley/ubuntu-tomcat7
==================

docker image for tomcat7
based off of ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-tomcat7`

Example usage:
`docker run -p 8080 -d mbentley/ubuntu-tomcat7`

To deploy a specific .war file to ROOT, see the commented out section of the `Dockerfile`.
