mbentley/ubuntu-jenkins
==================

docker image for jenkins; this image has been customized for compiling nginx.

To pull this image:
`docker pull mbentley/ubuntu-jenkins`

Example usage:
`docker run -p 8080 -d mbentley/ubuntu-jenkins`


Jenkins configuration:
* Project name: `nginx`
* Discard Old Builds: enabled
  * Log Rotation:
     * Days to keep builds: `30`
     * Max # of builds to keep: `30` 
* Mercurial
  * Repository URL: `http://hg.nginx.org/nginx`
  * Branch: `default`
  * Poll SCM: `H * * * *`
* Build
  * Execute shell:

```
cd $WORKSPACE
./auto/configure \
--sbin-path=/usr/local/sbin \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/lock/nginx.lock \
--http-log-path=/var/log/nginx/access.log \
--with-http_dav_module \
--http-client-body-temp-path=/var/lib/nginx/body \
--with-http_ssl_module \
--with-http_realip_module \
--http-proxy-temp-path=/var/lib/nginx/proxy \
--with-http_stub_status_module \
--http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
--with-http_auth_request_module \
--user=www-data \
--group=www-data
make
./objs/nginx -v
```
