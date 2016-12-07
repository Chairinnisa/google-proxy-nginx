#!/bin/bash

DOMAIN=$BIND_DOMAIN
LANG=$BIND_LAN
PORT=$PORT

if [[ $DOMAIN == '' ]]; then
	DOMAIN='www.example.com'
fi

if [[ $LANG == '' ]]; then
	LANG='de'
fi

# ADD google
cat << EOF > /etc/nginx/conf.d/google.conf
server {
	server_name $DOMAIN;
	listen       $PORT;
	location / {
        google on;
        google_scholar on;
        google_language $LANG;
    }
}
EOF