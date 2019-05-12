FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40


RUN yum -y --setopt=tsflags=nodocs update; yum -y --setopt=tsflags=nodocs install httpd openssh-server passwd sudo
RUN yum -y --setopt=tsflags=nodocs install apache2 php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml ; yum clean all;


ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd
RUN chmod 755 /start.sh
RUN ./start.sh

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]


