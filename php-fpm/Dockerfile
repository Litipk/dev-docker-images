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

FROM litipk/dev-php-cli:latest
LABEL vendor="Litipk"                                                          \
      maintainer="Andrés Correa Casablanca <castarco@litipk.com>"

ENV PHP_IDE_CONFIG serverName=adsmurai.dev

RUN `# Install FPM`                                                         && \
    apt-get -y install php7.1-fpm=7.1.*                                     && \
    `# `                                                                    && \
    `# Configure FPM`                                                       && \
    WWW_FILE="/etc/php/7.1/fpm/pool.d/www.conf"                             && \
    FPM_FILE="/etc/php/7.1/fpm/php-fpm.conf"                                && \
    sed -i "/^listen = /clisten = 0.0.0.0:9000"                  $WWW_FILE  && \
    sed -i "/^;catch_workers_output/ccatch_workers_output = yes" $WWW_FILE  && \
    sed -i "s#user = www-data#user = $MAIN_CONTAINER_USER #"     $WWW_FILE  && \
    sed -i "s#group = www-data#group = $MAIN_CONTAINER_USER #"   $WWW_FILE  && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g"          $FPM_FILE  && \
    mkdir -p /run/php                                                          ;

COPY entry_point_hook.sh /usr/local/bin/entry_point_hook.sh

EXPOSE 9000
CMD ["php-fpm7.1", "-F"]
