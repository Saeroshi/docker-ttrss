#!/bin/sh

UID=${UID:-1664} 
GID=${GID:-1664}

if [ -f /config/config.php ];then
    ln -s /config/config.php /ttrss/config.php
else
    cp -a /ttrss/config.php-dist /config/config.php-dist
    echo "ERREUR : Fichier /config/config.php introuvable, un fichier /config/config.php-dist à été ajouté."
    exit 1
fi

chown -R $UID:$GID /var/log /php /nginx /tmp /etc/s6.d /ttrss /config
exec su-exec $UID:$GID /bin/s6-svscan /etc/s6.d