echo '--------- ls'
ls -la

echo '--------- install composer dependencies'
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php83-composer:latest \
    composer install --ignore-platform-reqs

echo '--------- ls'
ls -la

echo '--------- sail build'
./vendor/bin/sail build
