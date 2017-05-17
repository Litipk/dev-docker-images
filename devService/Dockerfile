################################################################################
# WARNING: This is a development Dockerfile, don't use it in production. It's  #
# too heavy and too insecure.                                                  #
#                                                                              #
# This image is too heavy for production environments because it bundles many  #
# development dependencies,                                                    #
#                                                                              #
# This image is (probably) insecure because it hasn't been audited.            #
#                                                                              #
################################################################################

FROM ubuntu:16.04
LABEL vendor="Litipk"                                                          \
      maintainer="Andrés Correa Casablanca <castarco@litipk.com>"

# Global environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ENV LANG C.UTF-8
ENV MAIN_CONTAINER_USER developer

RUN `# System Timezone`                                                     && \
    ln -sf /usr/share/zoneinfo/UTC /etc/localtime                              ;

RUN `# Install basic tooling`                                               && \
    apt-get update                                                          && \
    apt-get -y install                                                         \
        software-properties-common                                             \
        ca-certificates                                                        \
        curl                                                                   \
        git                                                                    \
        tig                                                                    \
        netcat-openbsd                                                         \
        openssl                                                                \
        vim                                                                    \
        wget                                                                   ;

RUN `# Configure SSH`                                                       && \
    echo "IdentityFile ~/.ssh/devglobal" >> /etc/ssh/ssh_config                ;

RUN `# Install Gosu`                                                        && \
    GOSU_URL="https://github.com/tianon/gosu"                                                        && \
    GOSU_VERSION="1.10"                                                                              && \
    GNUPG_HOME="$(mktemp -d)"                                                                        && \
    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"                                && \
    wget -O /usr/local/bin/gosu "$GOSU_URL/releases/download/$GOSU_VERSION/gosu-$dpkgArch"           && \
    wget -O /usr/local/bin/gosu.asc "$GOSU_URL/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"   && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4  && \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu                                 && \
    rm -r "$GNUPG_HOME" /usr/local/bin/gosu.asc                                                      && \
    chmod +x /usr/local/bin/gosu                                                                     && \
    gosu nobody true                                                           ;

COPY .gitconfig /home/$MAIN_CONTAINER_USER/.gitconfig
COPY entry_point.sh /usr/local/bin/entry_point.sh
COPY entry_point_hook.sh /usr/local/bin/entry_point_hook.sh

ENTRYPOINT ["/usr/local/bin/entry_point.sh"]
CMD ["bash"]
