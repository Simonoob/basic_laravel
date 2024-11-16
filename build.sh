echo '--------- composer install'
composer install

echo '--------- npm install'
npm install

echo '--------- sail build'
./vendor/bin/sail build
