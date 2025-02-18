FROM nginx:alpine

# Install OpenSSL
RUN apk add --no-cache openssl

# Copy SSL generation script
COPY generate-ssl.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/generate-ssl.sh

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf
