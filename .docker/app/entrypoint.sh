#!/bin/bash
dockerize -wait tcp://db:3306 -timeout 20s
composer install
cp -u .env.example .env
php artisan key:generate
php artisan migrate
php-fpm