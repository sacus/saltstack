include:
  - php.php-env

php-install:
  file.managed:
    - name: /usr/local/src/php-5.6.22.tar.gz
    - source: salt://php/files/php-5.6.22.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /usr/local/src && tar -zxf php-5.6.22.tar.gz && cd php-5.6.22 && ./configure --prefix=/application/php-5.6.22 --with-mysql=/application/mysql   --with-iconv-dir=/usr/local/libiconv --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-fpm --enable-mbstring --with-mcrypt --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --enable-short-tags --enable-zend-multibyte --enable-static --with-xsl --with-fpm-user=nginx --with-fpm-group=nginx --enable-ftp  &&  ln -s /application/mysql/lib/libmysqlclient.so.18  /usr/lib64/    &&  touch ext/phar/phar.phar && echo "/application/mysql/lib">>/etc/ld.so.conf && echo "/application/mysql/lib">>/etc/ld.so.conf.d/mysql-x86_64.conf  && ldconfig &&  make &&  make install && ln -s /application/php-5.6.22 /application/php && cp php.ini-production /application/php/lib/php.ini && cp /application/php/etc/php-fpm.conf.default /application/php/etc/php-fpm.conf 
    - unless: test -d /application/php-5.6.22
    - require:
      - pkg: php-env
      - file: php-install

