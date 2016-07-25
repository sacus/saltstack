include:
  - pkg.pre-env

nginx-install:
  file.managed:
    - name: /usr/local/src/nginx-1.10.1.tar.gz
    - source: salt://nginx/files/nginx-1.10.1.tar.gz
    - user: root
    - group: root
    - mode: 644

  cmd.run:
    - name: useradd nginx -s /sbin/nologin -M && cd /usr/local/src && tar -zxf nginx-1.10.1.tar.gz && cd nginx-1.10.1 && ./configure --prefix=/application/nginx-1.10.1 --user=nginx --group=nginx --with-http_ssl_module --with-http_stub_status_module && make && make install && ln -s /application/nginx-1.10.1 /application/nginx 
    - unless: test -d  /application/nginx-1.10.1
    - require:
      - pkg: pkg-init
      - file: nginx-install
