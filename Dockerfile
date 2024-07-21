FROM php:8.3-fpm

LABEL maintainer="Flavio Medeiros <smedeiros.flavio@gmail.com>"

# Update and upgrade Linux
RUN apt-get update && apt-get upgrade -y

# Install Ubuntu Linux dependencies
RUN apt-get install -y --no-install-recommends \
  $PHPIZE_DEPS \
  nginx \
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
RUN docker-php-ext-configure gd \
  --prefix=/usr \
  --with-jpeg \
  --with-webp \
  --with-xpm \
  --with-freetype \
  && docker-php-ext-install -j$(nproc) \
  gd \
  opcache \
  pcntl \
  pdo_mysql \
  pdo_pgsql \
  zip \
  sockets \
  sodium \
  exif

# Install pecl ds igbinary extensions
RUN pecl update-channels \
  && pecl install ds igbinary \
  && docker-php-ext-enable ds igbinary

# Install Redis + MongoDB extension
RUN pecl install -D 'enable-redis-igbinary="yes"' redis mongodb \
  && docker-php-ext-enable redis mongodb 


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
