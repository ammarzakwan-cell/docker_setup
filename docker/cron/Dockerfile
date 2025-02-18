FROM php:8.4-fpm-alpine

# Install necessary Alpine packages
RUN apk add --no-cache \
    tzdata

# Set the timezone to Asia/Kuala Lumpur
ENV TZ=Asia/Kuala_Lumpur
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY crontab /etc/crontabs/root
RUN mkdir /var/log/cron

CMD ["crond", "-f"]