# Makefile for Laravel development
# Richard Antal Nagy, 2022
# https://gitlab.com/richardnagy/makefiles

# Settings
package_folder := vendor
params := # Serve parameters

# Default help command to list available commands
help::
	@echo "Laravel development makefile"
	@echo ""
	@echo "Command utilities:"
	@echo "make|make help - This command, shows available commands"
	@echo "make serve - Starts the laravel server"
	@echo "make install - Installs required composer and npm packages, runs npm production and php key generation"
	@echo "make seed - Fresh migrates and seeds the database" - Fresh migrates and seeds the database
	@echo "make model mod=MODELNAME - Creates a model with migration, seeder and factory"
	@echo "make key - Creates a model with migration, seeder and factory"
	@echo "make setup - Installs required php packages and composer on Debian-based systems"
	@echo ""
	@echo "One-time commands:"
	@echo "make new - Generate a new Laravel project using composer"

# Start server
serve:: vendor
	php artisan serve $(params)

# Install dependencies and keys
install:: composer.json
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
seed::
	@php artisan migrate:fresh
	@php artisan db:seed

# Generate a model with all components
model::
	@$(if $(value mod),,$(error Model is not set, use: make model mod=MODELNAME))
	@echo "Generating model: $(mod)"
	@php artisan make:model $(mod) -a

# Generate a new laravel project from sample
new::
	@echo "Generating new Laravel project.."
	composer create-project laravel/laravel default

# Generates artisan key
key::
	@php artisan key:generate

# Setup php and composer using apt and apache
setup::
	@echo "Installing php.."
	sudo apt install -y \
		apache2 \
		php \
		libapache2-mod-php \
		php-mbstring \
		php-xmlrpc \
		php-soap \
		php-gd \
		php-xml \
		php-cli \
		php-zip \
		php-bcmath \
		php-tokenizer \
		php-json \
		php-pear
	@echo "Installing composer.."
	curl -sS https://getcomposer.org/installer | php
	sudo mv composer.phar /usr/local/bin/composer
	sudo chmod +x /usr/local/bin/composer


# Install dependencies if vendor does not exist
vendor: install
