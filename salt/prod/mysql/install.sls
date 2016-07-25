include:
  - mysql.mysql-env

mysql-install:
  file.managed:
    - name: /usr/local/src/mysql-5.6.31.tar.gz
    - source: salt://mysql/files/mysql-5.6.31.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: useradd mysql -s /sbin/nologin -M && cd /usr/local/src && tar -zxf mysql-5.6.31.tar.gz && cd mysql-5.6.31 && cmake . -DCMAKE_INSTALL_PREFIX=/application/mysql-5.6.31 -DMYSQL_DATADIR=/application/mysql-5.6.31/data -DMYSQL_UNIX_ADDR=/application/mysql-5.6.31/tmp/mysql.sock -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DEXTRA_CHARSETS=gbk,gb2312,utf8,ascii -DENABLED_LOCAL_INFILE=ON -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_FEDERATED_STORAGE_ENGINE=1 -DWITH_BLACKHOLE_STORAGE_ENGINE=1 -DWITHOUT_EXAMPLE_STORAGE_ENGINE=1  -DWITH_FAST_MUTEXES=1 -DWITH_ZLIB=bundled -DENABLED_LOCAL_INFILE=1 -DWITH_READLINE=1 -DWITH_EMBEDDED_SERVER=1 -DWITH_DEBUG=0 && make && make install && ln -s /application/mysql-5.6.31 /application/mysql
    - unless: test -d /application/mysql-5.6.31
    - require:
      - pkg: mysql-env
      - file: mysql-install

