mysql-env:
  pkg.installed:
    - names:
      - ncurses-devel
      - libaio-devel

  file.managed:
    - name: /usr/local/src/cmake-2.8.8.tar.gz
    - source: salt://mysql/files/cmake-2.8.8.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /usr/local/src && tar -zxf cmake-2.8.8.tar.gz && cd cmake-2.8.8 && ./configure && gmake && gmake install 
    - unless: test -d /usr/local/share/cmake-2.8
