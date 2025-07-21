#!/bin/sh

# Catch Argument when 
ARGS="$@"

# Check File psalm.xml Exist or Not (if not exist generate first)
if [ ! -f "/var/www/html/psalm.xml" ]; then
    echo "Psalm Config Not Found!. Generating psalm.xml Config file...."
    (cd /var/www/html && psalm --init)
fi

# Remove Folder Vendor if Exist
if [ ! -d "/var/www/html/vendor" ]; then
    rm -rf /var/www/html/vendor
fi

# Generate Vendor with Psalm Package
(cd /var/www/html && composer install)

# Running Psalm Testing
echo "Running Static Analysis Security Testing with Psalm..."
psalm --config=/var/www/html/psalm.xml --root=/var/www/html $ARGS 
