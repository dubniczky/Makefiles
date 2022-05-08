# Makefile for Laravel development
# Richard Antal Nagy, 2022
# https://gitlab.com/richardnagy/makefiles

# Settings
package_folder := vendor
params := 

# Run even if a file or folder with the same name exists
.PHONY: serve install seed model new setup

# Start server
serve: vendor
	php artisan serve $(params)

# Install dependencies and keys
install: composer.json
	@echo "Installing PHP dependencies.."
	@composer install --no-interaction --quiet
	@echo "Installing Node dependencies.."
	@npm install --silent
	@echo "Generating ui pack.."
	@npm run prod
	@echo "Generating app key.."
	@php artisan key:generate
	@echo "Done."

# Seed the database
seed:
	@php artisan migrate:fresh
	@php artisan db:seed

# Generate a model with all components
model:
	@$(if $(value mod),,$(error Model is not set, use: make model mod=MODELNAME))
	@echo "Generating model: $(mod)"
	@php artisan make:model $(mod) -a

# Generate a new laravel project from sample
new:
	@echo "Generating new Laravel project.."
	composer create-project laravel/laravel default

# Setup php and composer using apt and apache
setup:
	@echo "Installing php.."
	sudo apt install -y \
		apache2\
		php\
		libapache2-mod-php\
		php-mbstring\
		php-xmlrpc\
		php-soap\
		php-gd\
		php-xml\
		php-cli\
		php-zip\
		php-bcmath\
		php-tokenizer\
		php-json\
		php-pear
	@echo "Installing composer.."
	curl -sS https://getcomposer.org/installer | php
	sudo mv composer.phar /usr/local/bin/composer
	sudo chmod +x /usr/local/bin/composer

# Install dependencies if vendor does not exist
vendor: install