# Use official PHP image
FROM php:8.2-cli

# Install curl extension (needed for your bot)
RUN apt-get update && apt-get install -y libcurl4-openssl-dev \
&& docker-php-ext-install curl

# Set working directory
WORKDIR /var/www/html

# Copy all files
COPY . .

# Command to run the bot (use dynamic PORT)
CMD ["sh", "-c", "php -S 0.0.0.0:$PORT index.php"]