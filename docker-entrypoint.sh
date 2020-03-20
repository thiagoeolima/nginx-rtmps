#!/bin/bash

set -e

if [ -n "${YOUTUBE_KEY}" ]; then
	echo "Youtube activate."
	sed -i 's|#youtube|push '"$YOUTUBE_URL""$YOUTUBE_KEY"';|g' /etc/nginx/nginx.conf
else
	sed -i 's|#youtube| |g' /etc/nginx/nginx.conf
fi

if [ -n "${FACEBOOK_KEY}" ]; then
	echo "Facebook activate."
	sed -i 's|#facebook|push '"$FACEBOOK_URL""$FACEBOOK_KEY"';|g' /etc/nginx/nginx.conf 
else 
   sed -i 's|#facebook| |g' /etc/nginx/nginx.conf 
fi

cat /etc/nginx/nginx.conf 

	exit 1;
stunnel4

exec "$@"
