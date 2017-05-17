#!/usr/bin/env bash

# These two variables are only available in the scope of this script.
GROUP_ID="${LOCAL_GROUP_ID:-1000}"
USER_ID="${LOCAL_USER_ID:-1000}"

# We export with a prefix to avoid conflicts
export DOCKER_GROUP_ID="${GROUP_ID}"
export DOCKER_USER_ID="${USER_ID}"

export HOME="/home/${MAIN_CONTAINER_USER}"

if id "${MAIN_CONTAINER_USER}" >/dev/null 2>&1; then
    `exit 0` ; # User exists, nothing to do
else
    groupadd -o -g "${GROUP_ID}" "${MAIN_CONTAINER_USER}"                   && \
    useradd -o                                                                 \
        -u "${USER_ID}" -g "${GROUP_ID}"                                       \
        --home-dir "${HOME}" -M --shell /bin/bash "${MAIN_CONTAINER_USER}"  && \
    chown -R "${MAIN_CONTAINER_USER}":"${MAIN_CONTAINER_USER}" "${HOME}"       ;
fi ;

`exit $?`                                                                   && \
/usr/local/bin/entry_point_hook.sh                                          && \
exec /usr/local/bin/gosu "${MAIN_CONTAINER_USER}" "$@"
