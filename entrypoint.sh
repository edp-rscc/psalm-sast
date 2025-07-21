#!/bin/sh

# Catch Argument when 
ARGS="$@"

# Check File psalm.xml Exist or Not (if not exist generate first)
if [ ! -f "/var/www/html/psalm.xml" ]; then
    echo "Psalm Config Not Found!. Generating psalm.xml Config file...."
    (cd /var/www/html && psalm --init)
fi

# Check if Psalm is installed via Composer (vendor folder + binary exist)
if [ ! -d "/var/www/html/vendor/vimeo/psalm" ] || [ ! -f "/var/www/html/vendor/bin/psalm" ]; then
    # Generate Vendor with Psalm Package
    (cd /var/www/html && composer install)
fi

# Running Psalm Testing
echo "Running Static Analysis Security Testing with Psalm..."
psalm --config=/var/www/html/psalm.xml --root=/var/www/html $ARGS 
