#!/bin/sh

UID=${UID:-1664} 
GID=${GID:-1664}

if [ -f /config/config.php ];then
    cp -a /config/config.php /ttrss/config.php
else
    cp -a /ttrss/config.php-dist /config/config.php-dist
    echo "ERREUR aucun fichier de configuration dans config.php"
    exit 1
fi

chown -R $UID:$GID /var/log /php /nginx /tmp /etc/s6.d /ttrss /config
exec su-exec $UID:$GID /bin/s6-svscan /etc/s6.d