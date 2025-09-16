#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
apt-get update  -yq
apt-get install -yq --no-install-recommends apt-utils
apt-get dist-upgrade -yq
apt-get install -yq --no-install-recommends locales
locale-gen en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8 es_ES.UTF-8 fr_FR.UTF-8 it_IT.UTF-8 bg_BG.UTF-8
apt-get install -yq --no-install-recommends tzdata
apt-get install -yq --no-install-recommends git curl zlib1g-dev unzip openssh-client ca-certificates
apt-get install -yq --no-install-recommends software-properties-common
add-apt-repository ppa:ondrej/php -y
apt-get update  -yq
apt-get install -yq --no-install-recommends \
			php8.1-cli \
			php8.1-pdo php8.1-mysql php8.1-mysqli php8.1-sqlite3 php8.1-pgsql php8.1-mongodb \
			php8.1-curl php8.1-zip php8.1-bcmath php8.1-bz2 php8.1-gd php8.1-intl php8.1-imagick php8.1-mbstring \
			php8.1-xml php8.1-xsl php8.1-dom \
			php8.1-ldap php8.1-soap php8.1-xmlrpc php8.1-xmlwriter php8.1-phar \
			php8.1-imap php8.1-bz2 \
			php8.1-ctype php8.1-iconv php8.1-fileinfo php8.1-tokenizer \
			php8.1-apcu php8.1-memcached php8.1-redis php8.1-opcache \
			php8.1-amqp php8.1-igbinary php8.1-msgpack php8.1-pspell \
			php8.1-xdebug \
			apache2 libapache2-mod-php8.1
			wkhtmltopdf xvfb ghostscript imagemagick zbar-tools xpdf-utils p7zip-full p7zip-rar default-jre unoconv timelimit inkscape tnef jpegoptim libjpeg-turbo-progs optipng pngquant wget \
			webp
a2dismod mpm_event
a2enmod php8.1 actions rewrite headers expires deflate env filter mime setenvif remoteip mpm_prefork
