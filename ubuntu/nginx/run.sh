#!/bin/bash

# supervisor
cat << EOF > /etc/supervisor/supervisord.conf
[supervisord]
nodaemon=false

[unix_http_server]
file=/var/run//supervisor.sock
chmod=0700

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///var/run//supervisor.sock

[include]
files = /etc/supervisor/conf.d/*.conf
EOF

# generate supervisor config for nginx
cat << EOF >> /etc/supervisor/conf.d/nginx.conf
[program:nginx]
priority=10
directory=/etc/nginx
command=nginx -c /etc/nginx/nginx.conf
user=root
autostart=true
autorestart=true
stdout_logfile=/var/log/nginx/nginx.log
stderr_logfile=/var/log/nginx/nginx.err
EOF

supervisord -c /etc/supervisor/supervisord.conf -n
