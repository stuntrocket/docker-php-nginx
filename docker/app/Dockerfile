FROM ubuntu:20.04

LABEL maintainer="Danny Harding"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
&& apt-get install -y locales \
&& locale-gen en_GB.UTF-8

ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8

RUN apt-get install -y gnupg curl zip unzip git software-properties-common \ 
&& add-apt-repository ppa:ondrej/php \ 
&& apt-get update \
&& apt-get install -y supervisor sqlite3 nginx \
   libpng-dev libonig-dev libxml2-dev \
&& apt-get install -y php7.1-cgi php7.1-cli php7.1-fpm \
   php7.1-bcmath php7.1-bz2 php7.1-curl php7.1-dba php7.1-dev php7.1-enchant \
   php7.1-gd php7.1-gmp php7.1-imap php7.1-interbase php7.1-intl php7.1-json php7.1-ldap \
   php7.1-mbstring  php7.1-mysql php7.1-odbc php7.1-opcache php7.1-pgsql php7.1-phpdbg \
   php7.1-pspell php7.1-readline php7.1-snmp php7.1-soap php7.1-sqlite3 php7.1-sybase php7.1-tidy \
   php7.1-xml php7.1-xmlrpc php7.1-xsl php7.1-zip php-msgpack php-igbinary \
&& php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
&& mkdir -p /run/php \
&& apt-get -y autoremove \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& echo "daemon off;" >> /etc/nginx/nginx.conf \ 
&& ln -sf /dev/stdout /var/log/nginx/access.log \
&& ln -sf /dev/stderr /var/log/nginx/error.log

COPY default /etc/nginx/sites-available/default
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
COPY start-container.sh /usr/bin/start-container

RUN chmod +x /usr/bin/start-container

ENTRYPOINT ["start-container"]
