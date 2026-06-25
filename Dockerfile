# syntax=docker/dockerfile:1.7
#
# medeiroz/php:8.5-frankenphp-alpine
#
# General-purpose PHP 8.5 base on the latest FrankenPHP Alpine runtime, with the
# extensions and tooling our Laravel apps need pre-compiled. Consuming apps use
# this image for BOTH their build and runtime stages so PHP extensions are never
# compiled per app build. Node is intentionally NOT included — apps that need a
# JS toolchain add it only in their build stage.
FROM dunglas/frankenphp:php8.5-alpine

LABEL maintainer="Flavio Medeiros <smedeiros.flavio@gmail.com>"

# System tooling: git (Composer source installs), curl (health checks),
# dcron (cron daemon + crontab) for scheduled tasks.
RUN apk add --no-cache git curl dcron

# Composer, copied from the official image to pin a known-good binary.
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# PHP extensions. install-php-extensions (shipped in the FrankenPHP image) pulls
# in each extension's apk build/runtime deps, compiles, and removes the build
# deps — so no toolchain is left behind in the final image. igbinary is listed
# before redis so install-php-extensions enables redis' igbinary serializer.
RUN install-php-extensions \
    bcmath \
    ds \
    exif \
    gd \
    igbinary \
    intl \
    mongodb \
    opcache \
    pcntl \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    redis \
    sockets \
    sodium \
    zip
