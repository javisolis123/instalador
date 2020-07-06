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
if [ $op -eq 2 ]; then
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
fi
if [ $op -eq 4 ]; then
	clear
	exit
fi
