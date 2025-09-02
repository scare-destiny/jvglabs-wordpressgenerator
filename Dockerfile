FROM wordpress:6.4-php8.2-apache         
COPY wp-init.sh /docker-entrypoint-init.d/10-wp-init.sh
RUN chmod +x /docker-entrypoint-init.d/10-wp-init.sh