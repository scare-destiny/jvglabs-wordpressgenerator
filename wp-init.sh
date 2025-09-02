#!/usr/bin/env bash
set -e

# Wait until DB is reachable
wp core install \
  --url="$WP_URL" \
  --title="$WP_TITLE" \
  --admin_user="$WP_ADMIN_USER" \
  --admin_password="$WP_ADMIN_PASS" \
  --admin_email="$WP_ADMIN_MAIL" \
  --skip-email

# slim white theme (twentytwentythree works for prototype)
wp theme install twentytwentythree --activate

# delete defaults, add required pages
wp post delete $(wp post list --post_type='post' --format=ids) --force
for p in "Home" "Blog" "Imprint"; do
  wp post create --post_type=page --post_status=publish --post_title="$p"
done

# menu
wp menu create "Main"
wp menu item add-page Main Home    0
wp menu item add-page Main Blog    1
wp menu item add-page Main Imprint 2
wp menu assign Main primary

# Optional – drop dummy plugins
wp plugin delete hello akismet