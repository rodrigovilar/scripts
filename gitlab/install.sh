#!/bin/bash

if [ -z $1 ]; then
	echo "Usage: $ ./install.sh IP_SERVER"
	exit 1
fi
{
	yum -y install openssh-server
	service postfix start
	chkconfig postfix on
	lokkit -s http -s ssh

	curl -O https://downloads-packages.s3.amazonaws.com/centos-6.6/gitlab-7.9.0_omnibus.2-1.el6.x86_64.rpm

	rpm -i gitlab-7.9.0_omnibus.2-1.el6.x86_64.rpm
	gitlab-ctl reconfigure

	sudo sh -c "echo 'external_url 'http://$1.com:8081'' >> gitlab.rb"
	cp -f gitlab.rb /etc/gitlab/

	echo "###########################################################################"
	echo "################################## WATCH ##################################"
	echo "###########################################################################"
	echo "- "
	echo "http://$1:8081"

} || {
	echo "Connection error"
}