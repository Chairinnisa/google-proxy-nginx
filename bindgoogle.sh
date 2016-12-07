#!/bin/bash


if [[ $BIND_DOMAIN == '' ]]; then
        BIND_DOMAIN='www.example.com'
fi

if [[ $BIND_LAN == '' ]]; then
        BIND_LAN='de'
fi

if [[ $PORT == '' ]]; then
        PORT='80'
fi

# ADD google
cat << EOF > /etc/nginx/conf.d/google.conf

server {
        resolver 8.8.8.8;
        server_name $BIND_DOMAIN;
        listen       $PORT;
        location / {
        proxy_buffers 8 24k;
        proxy_buffer_size 2k;
        google on;
        #google_scholar on;
        google_ssl_off "www.google.com";
        google_language $BIND_LAN;
    }
}
EOF
exec "$@"