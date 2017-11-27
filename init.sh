#!/usr/bin/env bash


if [[ "$(whoami)" == "root" ]]; then
  apt install php7.0-cli
  apt install php7.0-xml zip unzip php7.0-zip
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php composer-setup.php --install-dir=/usr/bin --filename=composer
  php -r "unlink('composer-setup.php');"
  composer create-project drupal-composer/drupal-project:8.x-dev web/app --stability dev --no-interaction
else
  echo "Run me as root!"
fi
