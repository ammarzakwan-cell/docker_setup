#!/bin/sh
set -e

CERTS_DIR="/certs/localhost"
DOMAIN="localhost"

# Create certs directory if not exists
mkdir -p "$CERTS_DIR"

# Generate certificates only if they don't exist
if [ ! -f "$CERTS_DIR/$DOMAIN/cert.pem" ]; then
    echo "Generating SSL certificates..."
    minica --domains "$DOMAIN" --ca-key "$CERTS_DIR/ca-key.pem" --ca-cert "$CERTS_DIR/ca-cert.pem"
    echo "SSL certificates created at $CERTS_DIR/$DOMAIN/"
else
    echo "SSL certificates already exist, skipping..."
fi

# Ensure certs are readable by other services
chmod -R 644 "$CERTS_DIR/$DOMAIN"/*

# Keep container running
exec tail -f /dev/null
