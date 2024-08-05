FROM php:7-apache

RUN a2enmod rewrite

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions \
		# apc \
		apcu \
		bcmath \
		bz2 \
		calendar \
		exif \
		ffi \
		gd \
		gettext \
		gmp \
		imagick \
		intl \
		mysqli \
		mysqlnd \
		pcntl \
		pdo \
		pdo_mysql \
		pspell \
		shmop \
		soap \
		sockets \
		sysvmsg \
		sysvsem \
		sysvshm \
		tidy \
		xmlrpc \
		xsl \
		opcache \
		zip

# Clean up
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/*