FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
ENV PHP_VERSION 8.1

# Ensure this version of Ubuntu is fully up to date
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install software-properties-common

# Install all APT package dependencies for the Difford's Guide www container.
RUN \
	# Base packages \
	apt-get -y install tzdata whois locales apt-utils binutils build-essential ca-certificates cron curl less vim && \
\
	# Apache packages \
	apt-get -y install apache2 apache2-utils libapache2-mod-apreq2 libapache2-mod-php${PHP_VERSION} && \
\
	# PHP packages (version specific) \
	apt-get -y install phpunit php${PHP_VERSION} php${PHP_VERSION}-cli php${PHP_VERSION}-cgi php${PHP_VERSION}-common php${PHP_VERSION}-dev


# Enable mods to apache2 and PHP
RUN \
	a2enmod ssl && \
	a2enmod headers && \
	a2enmod vhost_alias

# Enable ports for Apache
RUN \
	> /etc/apache2/ports.conf && \
	echo "Listen 80" >> /etc/apache2/ports.conf && \
	echo "Listen 443" >> /etc/apache2/ports.conf && \
	echo "Header set X-Frame-Options: \"SAMEORIGIN\"" >> /etc/apache2/conf-enabled/security.conf 

## Install PHP composer to allow us to install PHP plugins
COPY etc/composer.json /home/difford/
RUN \
	curl --silent --show-error https://getcomposer.org/installer | php && \
	php${PHP_VERSION} composer.phar require

# Clean up any unnecessary packages
RUN apt autoremove -y

# Copy local files
COPY etc/ /etc/

WORKDIR /var/www
ENTRYPOINT /bin/bash /usr/local/bin/entry.sh
