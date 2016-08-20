#!/bin/sh

[ -f /run-pre.sh ] && /run-pre.sh

if [ ! -d /web/htdocs ] ; then
  mkdir -p /web/htdocs
  chown nginx:www-data -R /web/htdocs
fi

# start php-fpm
mkdir -p /web/logs/php-fpm
php-fpm

# start nginx
mkdir -p /web/logs/nginx
mkdir -p /tmp/nginx
chown nginx /tmp/nginx
chown nginx:www-data -R /web/htdocs
nginx
