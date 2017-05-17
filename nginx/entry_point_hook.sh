#!/usr/bin/env bash

setcap cap_net_bind_service=ep /usr/sbin/nginx                              && \
usermod -aG www-data "${MAIN_CONTAINER_USER}"                               && \
mkdir -p /var/log/nginx/                                                    && \
touch /var/log/nginx/error.log                                              && \
chown -R ${MAIN_CONTAINER_USER}:${MAIN_CONTAINER_USER} /var/log             && \
chown -R ${MAIN_CONTAINER_USER}:${MAIN_CONTAINER_USER} /var/lib/nginx          ;
