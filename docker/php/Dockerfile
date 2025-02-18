FROM php:8.4-fpm-alpine

WORKDIR /var/www/html

# Install necessary Alpine packages
RUN apk add --no-cache \
    bash \
    git \
    unzip \
    curl \
    tzdata

# Set the timezone to Asia/Kuala Lumpur
ENV TZ=Asia/Kuala_Lumpur
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install PHP extensions
RUN docker-php-ext-configure mysqli && \
    docker-php-ext-install mysqli pdo pdo_mysql && \
    docker-php-ext-enable opcache

# Install composer manually
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy the entire application AFTER dependencies are installed
COPY . .

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Expose PHP-FPM port
EXPOSE 9000

# PHP-FPM
CMD ["php-fpm"]
