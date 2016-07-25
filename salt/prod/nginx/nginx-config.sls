nginx-config:
  cmd.run:
    - name: egrep -v "#|^$" /application/nginx/conf/nginx.conf.default >/application/nginx/conf/nginx.conf && echo "export PATH=$PATH:/application/nginx/sbin" >>/etc/profile && source /etc/profile

