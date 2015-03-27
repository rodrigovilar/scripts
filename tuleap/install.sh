#!/bin/bash

#!/bin/bash

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]; then
	echo "Usage: $ ./install.sh IP_SERVER USER PASSWORD"
else
	rpm -ivh http://fr2.rpmfind.net/linux/epel/6/i386/epel-release-6-8.noarch.rpm
	rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
	yum -y install htop
	iptables -I INPUT 5 -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
	iptables -I INPUT 5 -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
	cp Tuleap.repo /etc/yum.repos.d
	yum -y install --enablerepo=rpmforge-extras --skip-broken tuleap-all 
	/usr/share/tuleap-install/setup.sh
	netstat -lntp
	yum -y install glibc.i686
	service openfire start
	netstat -lntp
	yum -y install tuleap-plugin-agiledashboard && yum -y install tuleap-plugin-cardwall

	yum -y install libsasl2-modules                       
	yum -y install postfix                        
	sudo sh -c "echo 'myhostname = $1' >> main.cf"
	cp -f main.cf /etc/postfix/
	> sasl_passwd
	sudo sh -c "echo '[smtp.gmail.com]:$2@gmail.com:$3' >> sasl_passwd" 
	cp -f sasl_passwd /etc/postfix/    
	postmap /etc/postfix/sasl_passwd


	echo "########################"
	echo "# Instalation Complete #"
	echo "########################"

	echo "http://$1"
	echo "USER DEFAULT"
	echo "Login: Admin"
	echo "Password: siteadmin"

	echo "Acess URL the confirm plugins instalation"

	echo "http://$1/plugins/pluginsadministration/?action=install&name=cardwall"
	echo "http://$1/plugins/pluginsadministration/?action=install&name=agiledashboard"

	echo "Enable plugins"
	echo "http://$1/plugins/pluginsadministration/?"
fi



