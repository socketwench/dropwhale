FROM php:fpm
MAINTAINER tess@deninet.com

# Packages
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libbz2-dev \
    libxslt-dev \
    libldap2-dev \
    php-pear \
    curl \
    git \
    subversion \
    unzip \
    wget \
    mysql-client \
  && rm -r /var/lib/apt/lists/*

# PHP Extensions
RUN docker-php-ext-install bcmath mcrypt zip bz2 mbstring pcntl xsl json mysqli pdo pdo_mysql opcache \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install gd
  # \
  # && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
  # && docker-php-ext-install ldap

COPY composer-install.sh /tmp/composer-install.sh
RUN cd /tmp && \
    chmod +x composer-install.sh && \
    ./composer-install.sh

# Install Drupal Console.
RUN composer global require drupal/console:@stable && \
    ln -s /root/.composer/vendor/bin/drupal /usr/bin/drupal

# Install Drush.
RUN composer global require drush/drush:dev-master && \
    ln -s /root/.composer/vendor/bin/drush /usr/bin/drush

# Install phpcs and Drupal code sniffer.
RUN composer global require drupal/coder && \
    ln -s /root/.composer/vendor/bin/phpcs /usr/bin/phpcs && \
    phpcs --config-set installed_paths /root/.composer/vendor/drupal/coder/coder_sniffer/

# Install xdebug.
ADD http://xdebug.org/files/xdebug-2.4.0.tgz /tmp/xdebug-2.4.0.tgz
RUN cd /tmp && \
    tar -xzf xdebug-2.4.0.tgz && \
    cd xdebug-2.4.0 && \
    phpize && \
    ./configure && \
    make && \
    cp modules/xdebug.so /usr/local/lib/php/extensions/xdebug.so

# Add custom PHP configuration changes from php.ini
COPY php.ini /usr/local/etc/php/

# Copy various Dropwhale-specific scripts and mark as executable.
COPY init.sh /root/scripts/init.sh
RUN chmod +x /root/scripts/init.sh

COPY rebuild.sh /root/scripts/rebuild.sh
RUN chmod +x /root/scripts/rebuild.sh

COPY phpunit.sh /root/scripts/phpunit.sh
RUN chmod +x /root/scripts/phpunit.sh

COPY run-tests.sh /root/scripts/run-tests.sh
RUN chmod +x /root/scripts/run-tests.sh

WORKDIR /var/www/html
