mbentley/debian-jenkins
==================

docker image for jenkins; this image has been customized for compiling nginx.

To pull this image:
`docker pull mbentley/debian-jenkins`

Example usage:
`docker run -p 8080 -i -t -d mbentley/debian-jenkins`


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
if [ ! -d nginx-dav-ext-module ]
then
git clone https://github.com/arut/nginx-dav-ext-module.git
fi

if [ ! -d ngx_http_auth_pam_module-1.2 ]
then
wget http://web.iti.upv.es/~sto/nginx/ngx_http_auth_pam_module-1.2.tar.gz
tar zxf ngx_http_auth_pam_module-1.2.tar.gz
rm ngx_http_auth_pam_module-1.2.tar.gz
fi

./auto/configure \
--sbin-path=/usr/local/sbin \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/lock/nginx.lock \
--http-log-path=/var/log/nginx/access.log \
--with-http_dav_module \
--add-module=$WORKSPACE/nginx-dav-ext-module \
--http-client-body-temp-path=/var/lib/nginx/body \
--with-http_ssl_module \
--with-http_realip_module \
--http-proxy-temp-path=/var/lib/nginx/proxy \
--with-http_stub_status_module \
--http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
--with-http_auth_request_module \
--add-module=$WORKSPACE/ngx_http_auth_pam_module-1.2 \
--user=www-data \
--group=www-data

make

./objs/nginx -v
```
