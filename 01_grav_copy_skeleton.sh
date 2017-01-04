#!/bin/sh

# change into the grav directory
cd /usr/share/nginx/html/

# copy skeleton to users if the plugins folder does not exist
if [ ! -e /usr/share/nginx/html/user/plugins ]; then
    cp -a /usr/src/grav-skeleton/* user/
    chown -R www-data.www-data user/
fi
