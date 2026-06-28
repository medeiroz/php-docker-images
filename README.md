# PHP Docker Images focos on Laravel

This repository contains Docker images optimized for Laravel applications. These images are designed to provide a robust, scalable, and efficient environment for running Laravel applications in Docker containers.

## Features

- **Optimized for Laravel**: Pre-configured to meet Laravel's requirements, ensuring smooth deployments.
- **PHP Extensions**: Includes essential PHP extensions for Laravel, such as `Imagick` (HEIC/WebP), `Redis`, `MongoDB`, `Intl`, `BCMath`, `GD`, PDO (MySQL/PgSQL), and more (see the full list below).
- **Composer Pre-installed**: Comes with Composer pre-installed to manage your PHP dependencies.
- **Environment Customization**: Easy to customize PHP settings and configurations to match your specific needs.

## Available Tags
- `8.5-frankenphp-alpine`: PHP 8.5 on FrankenPHP (Alpine) with Laravel optimizations.
- `8.3-fpm`: PHP 8.3 fpm with Laravel optimizations.
- `8.2-fpm`: PHP 8.2 fpm with Laravel optimizations.
- More tags available on the [Docker Hub page](#https://hub.docker.com/r/medeiroz/php).

## Getting Started

To use these Docker images for your Laravel application, you can pull the image from Docker Hub:

```bash
docker pull medeiroz/php:8.3-fpm
```

Access the [Example Larave Application](https://github.com/medeiroz/laravel-skeleton) to see how to use the Docker images in a Laravel application.

## Available PHP Extensions
- BCMath
- Data Structures (ds)
- Excimer (sampling profiler for Sentry)
- Exif
- GD
- Igbinary
- Imagick (with HEIC/HEIF + WebP support)
- Intl
- MongoDB
- Opcache
- Pcntl
- PDO MySQL
- PDO PgSQL
- PgSQL
- Redis
- Sockets
- Sodium
- Zip

## Available Additional Tools
- Composer
- Git
- Curl
- Cron (dcron)

## Contributing
Contributions are welcome! Please feel free to submit a pull request to add new features, optimizations, or updates to the Docker images.

## License
This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.