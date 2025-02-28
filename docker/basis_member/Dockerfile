FROM php:8.2-fpm-alpine

WORKDIR /srv/basis_member

# Install necessary Alpine packages
RUN apk add --no-cache \
    bash \
    git \
    unzip \
    curl \
    tzdata \
    libpng-dev \
    libxml2-dev \
    oniguruma-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libxslt-dev \
    icu-dev

# Set the timezone to Asia/Kuala Lumpur
ENV TZ=Asia/Kuala_Lumpur
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install \
        gd \
        mysqli \
        pdo \
        pdo_mysql \
        calendar \
        soap \
        xsl \
        intl && \
    docker-php-ext-enable opcache

# Install composer manually
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy the entire application AFTER dependencies are installed
COPY . .

# Set correct permissions
RUN chown -R www-data:www-data /srv

# Expose PHP-FPM port
EXPOSE 9000

# PHP-FPM
CMD ["php-fpm"]
