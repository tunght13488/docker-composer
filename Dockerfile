FROM alpine:3.3
MAINTAINER Tung Ha "tunght13488@gmail.com"

# Install Composer's dependencies
RUN apk add --update \
    curl \
    git \
    subversion \
    mercurial \
    php-cli \
    php-json \
    php-phar \
    php-openssl \
  && rm -rf /var/cache/apk/*

# Install Composer
ENV COMPOSER_VERSION 1.0.0-alpha11
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}

# Run as user
USER 1000

CMD [ "--version" ]
ENTRYPOINT ["composer", "--ansi"]
