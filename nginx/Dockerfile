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


RUN `# Add NGINX repository`                                                && \
    echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list      && \
    echo "deb-src http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list  && \
    wget -qO- http://nginx.org/keys/nginx_signing.key | apt-key add -       && \
    `# `                                                                    && \
    `# Install Nginx`                                                       && \
    apt-get install -y nginx-extras=1.10.*                                     ;

COPY entry_point_hook.sh /usr/local/bin/entry_point_hook.sh
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443
CMD ["nginx"]
