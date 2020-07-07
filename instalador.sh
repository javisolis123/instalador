#!/bin/bash
function menu {
	echo 1.- Instalacion SMR
	echo 2.- Instalacion ECM
	echo 3.- Instalacion CCM
	echo 4.- SALIR
	echo -e
	echo opcion --: 
}
clear
menu
read op
#Condición si el usuario quiere instalar y configurar el SMR
if [ $op -eq 1 ]; then
	sudo apt-get install mariadb-server
	clear
	echo Desea correr el instalar seguro de MySQL: s/n
	read op1
	if [ $op1 == "s" ]; then
		clear
		sudo mysql_secure_installation
	fi
	sudo apt-get install apache2 php libapache2-mod-php php-mysql
	sudo apt -y install phpmyadmin
	
fi
#Condición si el usuario quiere instalar y configurar el ECM
if [ $op -eq 2 ]; then
	sudo apt-get install mariadb-server
	clear
	echo Desea correr el instalar seguro de MySQL: s/n
	read op1
	if [ $op1 == "s" ]; then
		clear
		sudo mysql_secure_installation
	fi
	sudo apt-get install apache2 
	sudo apt-get install php libapache2-mod-php php-mysql
	sudo apt-get install phpmyadmin
	cd ~/
	git clone https://github.com/javisolis123/ECM-COMTECO.git
	cd ~/
	git clone https://github.com/javisolis123/ECM-FLASK-SERVER.git
	cd ~/
	git clone https://github.com/javisolis123/ECM-SUPERVISOR.git
	cd ~/ECM-COMTECO
	source bin/activate
	pip3 install -r requirements.txt
	

fi
#Condición si el usuario quiere instalar y configurar el CCM
if [ $op -eq 3 ]; then
	sudo apt-get install mariadb-server
	clear
	echo Desea correr el instalar seguro de MySQL: s/n
	read op1
	if [ $op1 == "s" ]; then
		clear
		sudo mysql_secure_installation
	fi
	sudo apt-get install apache2 php libapache2-mod-php php-mysql
	sudo apt -y install phpmyadmin
	cd ~/
	git clone https://github.com/javisolis123/Flask-WebServer.git
	cd ~/
	git clone https://github.com/javisolis123/CCM-supervisor.git
fi
if [ $op -eq 4 ]; then
	clear
	exit
fi
