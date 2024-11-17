# Dockerfile
FROM php:8.3

# Install Laravel dependencies and extensions
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libzip-dev \
    nodejs \
    npm

RUN npm install -g npm

RUN curl -sLS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql zip

# Set the working directory
WORKDIR /var/www/html

# Copy Laravel app into the container
COPY . .

# Install app dependencies
RUN composer install
RUN npm install


# EXPOSE 80

# run migrations and start the server
# CMD php artisan migrate \
# && artisan serve --host=0.0.0.0 --port=8000
CMD php artisan serve --host=0.0.0.0 --port=80
