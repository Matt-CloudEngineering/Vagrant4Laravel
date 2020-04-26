##################################
# Run this script to setup project from the vagrant home directory
#
# NOTE:
# >>>>> Setup Github credentials before running script
#

read -p "What Git Repository to do want to clone (deafults to Latest Laravel on Git)?" gitclone
gitclone=${gitclone:-https://github.com/laravel/laravel.git}

echo "Cloning Repository"
git clone $gitclone /vagrant/www

echo "Installing Project Dependencies"
composer install -d /vagrant/www

echo "Building .env file"
cp /vagrant/www/.env.example /vagrant/www/.env

echo "Generating Laravel Key"
php /vagrant/www/artisan key:generate

echo "Linking Storage"
# if this fails make sure terminal is running as administrator
php /vagrant/www/artisan storage:link

echo "Laravel installed"
php /vagrant/www/artisan -V

#echo "Home directory shortcut created!"
#ln -s /vagrant/www ./www
