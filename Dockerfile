FROM php:apache-bookworm

RUN a2enmod rewrite

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# https://make.wordpress.org/hosting/handbook/server-environment/#php-extensions

# Required (those commented out are already enabled)
RUN install-php-extensions \
		# json \
		mysqli

# Highly recommended
RUN install-php-extensions \
		# curl \
		# dom \
		exif \
		# fileinfo \
		# hash \
		igbinary \
		imagick \
		intl \
		# mbstring \
		# openssl \
		# pcre \
		# xml \
		zip

# Recommended
RUN install-php-extensions \
		opcache \
		apcu
		# memcached (need only one of ACPu, memcached or redis)
		# redis

# Optional
RUN install-php-extensions \
		timezonedb

# Clean up
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/*