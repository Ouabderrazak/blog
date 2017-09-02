composer install
php app/console doctrine:database:create
composer update
php app/console doctrine:schema:update --force
php app/console fos:user:create
php app/console server:run