#!/bin/bash

DOMAIN=$1
LANG=$2

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
	listen       80;
	location / {
        google on;
        google_scholar on;
        google_language $LANG;
    }
}
EOF