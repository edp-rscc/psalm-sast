#!/bin/sh

# Catch Argument when 
ARGS="$@"

# Check File psalm.xml Exist or Not (if not exist generate first)
if [ ! -f "/var/www/html/psalm.xml" ]; then
    echo "Psalm Config Not Found!. Generating psalm.xml Config file...."
    (cd /var/www/html && psalm --init)
fi

# Running Psalm Testing
echo "Running Static Analysis Security Testing with Psalm..."
psalm --config=/var/www/html/psalm.xml --root=/var/www/html $ARGS 
