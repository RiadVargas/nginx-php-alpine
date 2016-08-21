FROM alpine:edge
MAINTAINER Riad Vargas de Oliveira riad@leafhost.com.br

RUN apk update \
    && apk add --update nginx ca-certificates php5-fpm php5-json php5-zlib php5-xml \
    php5-pdo php5-phar php5-openssl php5-pdo_mysql php5-mysqli php5-gd \
    php5-iconv php5-mcrypt php5-mysql php5-curl php5-zip php5-dom

# fix php-fpm "Error relocating /usr/bin/php-fpm: __flt_rounds: symbol not found" bug
RUN apk add -u musl
RUN rm -rf /var/cache/apk/*

ADD files/nginx.conf /etc/nginx/
ADD files/php-fpm.conf /etc/php/
ADD files/run.sh /
RUN chmod +x /run.sh


EXPOSE 80
VOLUME ["/web"]

CMD ["/run.sh"]
