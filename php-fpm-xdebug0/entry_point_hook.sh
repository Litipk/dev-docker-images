#!/usr/bin/env bash

usermod -aG www-data $MAIN_CONTAINER_USER                                   && \
mkdir -p /run/php                                                           && \
chown -R ${MAIN_CONTAINER_USER}:${MAIN_CONTAINER_USER} /run/php             && \
chown -R ${MAIN_CONTAINER_USER}:${MAIN_CONTAINER_USER} /var/log             && \
touch /var/tmp/xdebug.log                                                   && \
chown ${MAIN_CONTAINER_USER}:${MAIN_CONTAINER_USER} /var/tmp/xdebug.log        ;
