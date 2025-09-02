# Use official WordPress image as base
FROM wordpress:6.4-php8.2-apache          # or just “wordpress:latest”

# Copy your install/bootstrap script into the location
# WordPress’ entrypoint will execute on first boot
COPY wp-init.sh /docker-entrypoint-init.d/10-wp-init.sh
RUN chmod +x /docker-entrypoint-init.d/10-wp-init.sh