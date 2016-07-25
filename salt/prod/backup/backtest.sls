backup-test:
  file.managed:
    - name: /etc/yum.repos.d/CentOS-Base.repo
    - source: salt://backup/files/CentOS-Base.repo
    - backup: minion
    - user: root
    - group: root
    - mode: 644
