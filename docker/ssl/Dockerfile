FROM golang:1.21-alpine AS builder

# Install required dependencies
RUN apk add --no-cache git ca-certificates

# Clone and build minica from source
WORKDIR /build
RUN git clone https://github.com/jsha/minica.git && \
    cd minica && \
    go build -o /usr/local/bin/minica

# Final lightweight Alpine image
FROM alpine:latest

# Install required dependencies
RUN apk add --no-cache ca-certificates

# Copy minica binary from builder stage
COPY --from=builder /usr/local/bin/minica /usr/local/bin/minica

# Set working directory
WORKDIR /ssl

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run entrypoint
CMD ["/entrypoint.sh"]
