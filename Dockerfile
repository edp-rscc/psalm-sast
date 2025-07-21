# Import Base Image
FROM php:7.4-cli-alpine AS compiler

# Label Image
LABEL org.opencontainers.image.title="psalm-SAST"
LABEL org.opencontainers.image.description="Image for running Psalm Static Analysis Security Testing"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.authors="Haikal Raditya Fadhilah as EDP TEAM RSCC <edp.rscc@gmail.com>"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.source="https://github.com/edp-rscc/psalm-docker-sast"
LABEL org.opencontainers.image.created="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

# Install Alpine Depencies
RUN apk add --no-cache \
    curl \
    unzip \
    git 

# Copy Composer Package
COPY --from=composer:1.10.26 /usr/bin/composer /usr/local/bin/composer

# Install Psalm DAST Global
RUN composer global require vimeo/psalm

# Add Path Global
ENV PATH="/root/.composer/vendor/bin:${PATH}"

# Set Working Directory
WORKDIR /var/www/html

# Copy Entrypoint.sh File
COPY ./entrypoint.sh /entrypoint.sh

# User Configuration
USER root

# Running Entrypoint
ENTRYPOINT [ "/entrypoint.sh" ]
