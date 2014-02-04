mbentley/ubuntu-tomcat7
==================

docker image for tomcat7
based off of ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-tomcat7`

Example usage:
`docker run -p 8080 -d mbentley/ubuntu-tomcat7`

To deploy a specific .war file to ROOT, see the commented out section of the `Dockerfile`.

If you would like to start tomcat without any applications deployed and have a local volume mounted to be be able to deploy a .war file by dropping it in, here is an example of that process:
```
mkdir -p /data/tomcat_webapps
docker run -i -t -p 8080 -v /data/tomcat_webapps:/opt/tomcat/webapps mbentley/ubuntu-tomcat7
cp helloworld.war /data/tomcat_webapps/ROOT.war

```
