#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.

ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

echo "UseDNS no" >> /etc/ssh/sshd_config

/usr/sbin/sshd  

rm -rf /run/httpd/* /tmp/httpd*

exec /usr/sbin/apachectl -DFOREGROUND

