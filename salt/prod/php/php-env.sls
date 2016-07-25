php-env:
  pkg.installed:
    - names:
      - zlib-devel
      - libxml2-devel
      - libjpeg-turbo-devel
      - freetype-devel
      - libpng-devel
      - gd-devel
      - libcurl-devel
      - libmcrypt-devel
      - mhash
      - mhash-devel
      - php-mcrypt
      - libxslt-devel
 
  file.managed:
    - name: /usr/local/src/libiconv-1.14.tar.gz
    - source: salt://php/files/libiconv-1.14.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /usr/local/src && tar -zxf libiconv-1.14.tar.gz && cd libiconv-1.14 && ./configure --prefix=/usr/local/libiconv && make && make install
    - unless: test -d /usr/local/libiconv 
    

