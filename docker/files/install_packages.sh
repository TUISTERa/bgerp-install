#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
apt-get update  -yq
apt-get install -yq --no-install-recommends apt-utils gnupg2
apt-get dist-upgrade -yq
apt-get install -yq --no-install-recommends locales
locale-gen en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8 es_ES.UTF-8 fr_FR.UTF-8 it_IT.UTF-8 bg_BG.UTF-8
apt-get install -yq --no-install-recommends tzdata
apt-get install -yq --no-install-recommends git curl zlib1g-dev unzip openssh-client ca-certificates
apt-get install -yq --no-install-recommends software-properties-common
add-apt-repository ppa:ondrej/php -y
apt-get update  -yq
apt-get install -yq --no-install-recommends \
			php7.4-cli \
			php7.4-pdo php7.4-mysql php7.4-mysqli php7.4-sqlite3 php7.4-pgsql php7.4-mongodb \
			php7.4-curl php7.4-zip php7.4-bcmath php7.4-bz2 php7.4-gd php7.4-intl php7.4-imagick php7.4-mbstring \
			php7.4-xml php7.4-xsl php7.4-dom \
			php7.4-ldap php7.4-soap php7.4-xmlrpc php7.4-xmlwriter php7.4-phar \
			php7.4-imap php7.4-bz2 \
			php7.4-ctype php7.4-iconv php7.4-fileinfo php7.4-tokenizer \
			php7.4-apcu php7.4-memcached php7.4-redis php7.4-opcache \
			php7.4-amqp php7.4-igbinary php7.4-msgpack php7.4-pspell \
			php7.4-xdebug apache2 libapache2-mod-php7.4 \
			wkhtmltopdf xvfb ghostscript imagemagick zbar-tools xpdf-utils p7zip-full p7zip-rar default-jre unoconv timelimit inkscape tnef jpegoptim libjpeg-turbo-progs optipng pngquant wget \
			webp
a2dismod mpm_event
a2enmod php7.4 actions rewrite headers expires deflate env filter mime setenvif remoteip mpm_prefork
