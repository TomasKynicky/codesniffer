FROM php:8.4.4-cli-alpine3.20

RUN apk add bash

WORKDIR /code/

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN composer global require "squizlabs/php_codesniffer" --no-interaction --no-scripts --ansi
RUN composer global require "orisai/coding-standard" --no-interaction --no-scripts --no-plugins --ansi

RUN mkdir /src
COPY default /src/default

COPY code-sniffer.sh /usr/bin/code-sniffer
RUN chmod +x /usr/bin/code-sniffer
