#!/bin/bash

yum -y install openssh-server
service postfix start
chkconfig postfix on
lokkit -s http -s ssh

curl -O https://downloads-packages.s3.amazonaws.com/centos-6.6/gitlab-7.9.0_omnibus.2-1.el6.x86_64.rpm

rpm -i gitlab-7.9.0_omnibus.2-1.el6.x86_64.rpm
gitlab-ctl reconfigure

echo "###########################################################################"
echo "################################## WATCH ##################################"
echo "###########################################################################"
echo "- "
