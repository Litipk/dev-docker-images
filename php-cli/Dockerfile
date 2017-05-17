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

FROM litipk/dev-service:latest
LABEL vendor="Litipk"                                                          \
      maintainer="Andrés Correa Casablanca <castarco@litipk.com>"

RUN `# PHP7 & company packages`                                             && \
    add-apt-repository -y ppa:ondrej/php                                    && \
    apt-get update                                                          && \
    apt-get -y install                                                         \
        php7.1-cli=7.1.*                                                       \
        php-ast                                                                \
        php7.1-curl=7.1.*                                                      \
        php7.1-json=7.1.*                                                      \
        php7.1-soap=7.1.*                                                      \
        php7.1-xml=7.1.*                                                       \
        php7.1-mbstring=7.1.*                                                  \
        php7.1-gd=7.1.*                                                        \
        php7.1-bz2=7.1.*                                                       \
        php7.1-zip=7.1.*                                                       \
        php7.1-bcmath=7.1.*                                                    \
        php-memcached=3.0.*                                                    \
        php-memcache=3.0.*                                                     \
        php7.1-mysql=7.1.*                                                     \
        php-mongodb=1.2.*                                                      \
        openssl                                                                ;

RUN `# PHP Timezone`                                                        && \
    sed -i 's#;date.timezone =.*#date.timezone = "UTC"#' /etc/php/7.1/cli/php.ini ;

RUN `# Install Composer`                                                    && \
    php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["php"]
