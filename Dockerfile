FROM saeroshi/nginx-php:7.1


RUN apk add --no-cache git \
 && git clone --depth=1 https://git.tt-rss.org/git/tt-rss.git /ttrss \
 && apk del ${BUILD_DEPS} \
 && rm -rf /tmp/* /var/cache/apk/* /usr/src/* \
 && mkdir -p /config \
 && chmod +x /usr/local/bin/run.sh /etc/s6.d/*/* /etc/s6.d/.s6-svscan/*

VOLUME /nginx/logs /php/logs /config

EXPOSE 8888

CMD ["run.sh"]