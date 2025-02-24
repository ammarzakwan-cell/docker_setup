FROM php:8.4-fpm-alpine

# Install necessary packages
RUN apk add --no-cache \
    bash \
    tzdata \
    logrotate

# Create necessary log directories with correct permissions
RUN mkdir -p \
    /var/log/nginx \
    /var/log/cron \
    /var/log/basis_member \
    /var/log/basis_admin \
    /var/log/data_exchange \
    /var/log/minio && \
    chown -R root:root /var/log && \
    chmod -R 755 /var/log

# Set the timezone to Asia/Kuala Lumpur
ENV TZ=Asia/Kuala_Lumpur
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Copy custom logrotate configuration and fix line endings
COPY logrotate.conf /etc/logrotate.d/custom_logs

# Copy crontab and fix line endings
COPY crontab /etc/crontabs/root
RUN dos2unix /etc/crontabs/root && chmod 0644 /etc/crontabs/root

# Ensure cron and logrotate run correctly
CMD ["crond", "-f", "-d", "8"]