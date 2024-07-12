FROM php:8.3-fpm

LABEL maintainer="Flavio Medeiros <smedeiros.flavio@gmail.com>"

ARG NODE_VERSION=22

# Update and upgrade Linux
RUN apt-get update && apt-get upgrade -y

# Install Ubuntu Linux dependencies
RUN apt-get install -y --no-install-recommends \
  $PHPIZE_DEPS \
  curl \
  git \
  zip \
  unzip \
  cron \
  supervisor \
  libzip-dev \
  libz-dev \
  libcurl4-openssl-dev \
  pkg-config \
  libsodium-dev \
  libssl-dev \
  libpq-dev \
  libjpeg-dev \
  libpng-dev \
  libfreetype6-dev \
  libwebp-dev \
  libxpm-dev \
  libmcrypt-dev \
  libonig-dev

# Install PHP extensions
RUN docker-php-ext-install \
  opcache \
  pcntl \
  pdo_mysql \
  pdo_pgsql \
  zip \
  sockets \
  sodium \
  exif

# Install GD extension
RUN docker-php-ext-configure gd \
  --prefix=/usr \
  --with-jpeg \
  --with-webp \
  --with-xpm \
  --with-freetype \
  && docker-php-ext-install -j$(nproc) gd

# Install pecl ds igbinary extensions
RUN pecl update-channels && \
  pecl install ds igbinary && \
  docker-php-ext-enable ds igbinary

# Install Redis extension
RUN pecl install -D 'enable-redis-igbinary="yes"' redis && \
  docker-php-ext-enable redis

# Install MongoDB extension
RUN pecl install mongodb \
  docker-php-ext-enable mongodb

# Install gRPC extension
RUN pecl install grpc \
  docker-php-ext-enable grpc

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - \
  && apt-get install -y nodejs \
  && npm install -g npm \
  && npm install -g yarn

# Remove cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
