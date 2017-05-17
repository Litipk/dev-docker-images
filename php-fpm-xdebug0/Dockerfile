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

FROM adsmurai/dev/php-fpm:latest
LABEL vendor="Adsmurai"                                                        \
      maintainer_1="Rubén Vasallo <ruben@adsmurai.com>"                        \
      maintainer_2="Andrés Correa Casablanca <andreu@adsmurai.com>"

ENV PHP_IDE_CONFIG serverName=adsmurai.dev

RUN `# Install XDebug`                                                      && \
    apt-get -y install php-xdebug=2.5.*                                     && \
    `# `                                                                    && \
    `# Configure XDebug`                                                    && \
    XDEBUG_FILE="/etc/php/7.0/mods-available/xdebug.ini"                    && \
    echo 'xdebug.profiler_output_dir=/var/tmp/profiler'    >> $XDEBUG_FILE  && \
    echo 'xdebug.profiler_enable_trigger=0'                >> $XDEBUG_FILE  && \
    echo 'xdebug.profiler_enable=0'                        >> $XDEBUG_FILE  && \
    echo 'xdebug.max_nesting_level=1000'                   >> $XDEBUG_FILE  && \
    echo 'xdebug.show_local_vars=1'                        >> $XDEBUG_FILE  && \
    echo 'xdebug.remote_enable=1'                          >> $XDEBUG_FILE  && \
    echo 'xdebug.remote_port=9015'                         >> $XDEBUG_FILE  && \
    echo 'xdebug.remote_handler=dbgp'                      >> $XDEBUG_FILE  && \
    echo 'xdebug.idekey="PHPSTORM"'                        >> $XDEBUG_FILE  && \
    echo 'xdebug.remote_log="/var/tmp/xdebug.log"'         >> $XDEBUG_FILE  && \
    echo 'xdebug.remote_autostart=1'                       >> $XDEBUG_FILE  && \
    echo 'xdebug.remote_connect_back=1'                    >> $XDEBUG_FILE  && \
    echo ''                                                >> $XDEBUG_FILE  && \
    echo '; Remember to run xdebug in console command run' >> $XDEBUG_FILE  && \
    echo '; php -d xdebug.remote_host=172.18.0.1 script.php' >> $XDEBUG_FILE  && \
    echo ''                                                >> $XDEBUG_FILE  && \
    echo '; To tell PhpStorm which path mapping configuration it should use for'   >> $XDEBUG_FILE  && \
    echo '; a connection from a certain machine you need to set the value of the'  >> $XDEBUG_FILE  && \
    echo '; "PHP_IDE_CONFIG" environment variable to "serverName=SomeName",'       >> $XDEBUG_FILE  && \
    echo '; where `SomeName` is the name of the server configured in'              >> $XDEBUG_FILE  && \
    echo '; `Project Settings | PHP | Servers`. And that is all!'                  >> $XDEBUG_FILE  && \
    echo ''                                                >> $XDEBUG_FILE  && \
    echo '; For debug all commands in php run `export XDEBUG_CONFIG="serverName=adsmurai.dev remote_host=172.18.0.1"`' >> $XDEBUG_FILE && \
    `# `                                                                    && \
    `# Enable XDebug`                                                       && \
    phpenmod xdebug                                                            ;

ADD entry_point_hook.sh /usr/local/bin/entry_point_hook.sh
