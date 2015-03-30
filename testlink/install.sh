#!/bin/bash

if [ -z $1 ]; then
	echo "Usage: $ ./install.sh IP_SERVER"
	exit 1
fi	
	echo -ne "IP your off server: "; read IP_SERVER;
	yum -y install wget
	wget https://bitnami.com/redirect/to/49922/bitnami-testlink-1.9.13-0-linux-installer.run
	chmod +x bitnami-testlink-1.9.13-0-linux-installer.run && ./bitnami-testlink-1.9.13-0-linux-installer.run
	/home/root/testlink-1.9.13-0/ctlscript.sh start

	echo "###########################################################################"
	echo "################################## WATCH ##################################"
	echo "###########################################################################"
	echo "- "
	echo "To start/stop/restart application on Linux you can use the included ctlscript.sh utility, as shown below:"
	echo "./ctlscript.sh (start|stop|restart) "
	echo "./ctlscript.sh (start|stop|restart) mysql"
	echo "./ctlscript.sh (start|stop|restart) apache "
	echo "- "
	echo "start      - start the service(s) "
	echo "stop       - stop  the service(s) "
	echo "restart    - restart or start the service(s) "
	echo "###########################################################################"
	echo "- "
	echo "Acess home page"
	echo "http://$IP_SERVER:8080/testlink/"
