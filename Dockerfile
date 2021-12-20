FROM bitnami/php-fpm:7.4

RUN apt-get update && \
    apt-get install -y \
      supervisor \
      wget \
      curl \
      git \
      jq \
      vim \
      zip \
      unzip \
      bzip2 && \
    rm -Rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/bin && \
    curl -s -L -o /usr/local/bin/composer https://getcomposer.org/download/latest-stable/composer.phar && \
    chmod +x /usr/local/bin/composer && \
    mkdir -p /var/www/owa/ && \
    curl -L -s -o /var/www/owa/owa.tar https://github.com/Open-Web-Analytics/Open-Web-Analytics/releases/download/1.7.3/owa_1.7.3_packaged.tar && \
    tar xfv /var/www/owa/owa.tar && \
    rm -f /var/www/owa/owa.tar && \
    cd /var/www/owa; /usr/local/bin/composer install

USER 1000
WORKDIR /var/www/owa
