# Dockerfile
#latest composer to get the dependencies
FROM composer:2.3.10 as build
WORKDIR /app
COPY . /app
RUN composer install && composer dumpautoload
RUN php artisan optimize:clear

#PHP Apache docker image for php8.1
FROM php:8.1.0RC5-apache-buster
#adds library support for different image upload
RUN apt update && apt install -y zlib1g-dev libpng-dev libwebp-dev libjpeg-dev libfreetype6-dev && rm -rf /var/lib/apt/lists
