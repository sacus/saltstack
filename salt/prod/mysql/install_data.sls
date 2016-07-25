db_install_data_init:
  file.managed:
    - name: /usr/local/src/my.cnf
    - source: salt://mysql/files/my.cnf
    - user: root
    - group: root
    - mode: 644

  cmd.run:
    - name: mv /etc/my.cnf /etc/my.$(date +%F).cnf && cp /usr/local/src/my.cnf /etc/ &&chown -R 1777 /tmp && chown -R mysql:mysql /application/mysql/data  && echo "export PATH=$PATH:/application/mysql/bin" >> /etc/profile && source /etc/profile &&  /application/mysql/scripts/mysql_install_db --basedir=/application/mysql --datadir=/application/mysql/data --user=mysql && \cp /application/mysql/support-files/mysql.server /etc/init.d/mysqld    
    - onlyif: test -d /application/mysql/data

