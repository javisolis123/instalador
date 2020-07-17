#!/bin/bash
function menu {
	echo 1.- Instalacion SMR
	echo 2.- Instalacion ECM
	echo 3.- Instalacion CCM
	echo 4.- SALIR
	echo -e
	echo opcion --: 
}
while :
do
	clear
	menu
	read op
	#Condición si el usuario quiere instalar y configurar el SMR
	if [ $op -eq 1 ]; then
		#Actualizacion del sistema
		sudo apt-get update
		sudo apt-get upgrade
		#Instalacion de MariaDB
		sudo apt-get install mariadb-server
		clear
		echo Desea correr el instalar seguro de MySQL: s/n
		read op1
		#Opcion para correr el instalador seguro de mysql
		if [ $op1 == "s" ]; then
			clear
			sudo mysql_secure_installation
		fi
		#Seccion para Instalar LAMP, phpmyadmin y servidor FTP
		sudo apt-get install apache2 
		sudo apt-get install php libapache2-mod-php php-mysql
		sudo apt-get install phpmyadmin
		sudo apt-get install vsftpd
		sudo apt-get install python3-pip
		clear
		#Copia la configurar establecida al directorio raiz
		echo Configurando el servicio FTP
		sudo rm -rf /etc/vsftpd.conf
		sudo cp ~/instalador/Proyecto/SMR/Conf-FTP/vsftpd.conf /etc/
		clear
		echo Configurando la IP a 10.0.0.10
		sudo rm -rf /etc/dhcpcd.conf
		sudo cp ~/instalador/Proyecto/SMR/Conf-Eth/dhcpcd.conf /etc/
		clear
		echo Configurando MariaDB
		sudo rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
		sudo cp ~/instalador/Proyecto/SMR/Conf-MariaDB/50-server.cnf /etc/mysql/mariadb.conf.d/
		echo Configurando el SSH para SMR
		sudo rm -rf /etc/ssh/sshd_config
		sudo cp ~/instalador/Proyecto/SMR/Conf-SSH/sshd_config /etc/ssh/
		cd ~/
		#Clona el ropositorio SMR
		git clone https://github.com/javisolis123/SMR-COMTECO.git
		cd ~/SMR-COMTECO/
		source bin/activate
		#Actualiza PIP3
		pip3 install --upgrade pip
		#Instala dependencias del entorno virtual
		pip3 install -r requirements.txt
		#Instala la libreria para ADS1015
		pip3 install adafruit-circuitpython-ads1x15
		deactivate
		clear
		echo Es necesario reiniciar el dispositivo
		echo -e
		echo NOTA: LA IP POR DEFECTO ES LA 192.168.10.10 SSH_Puerto: 23
		echo -e
		echo Presione la tecla r para reiniciar o cualquier otra para saltar este paso
		read reinicio
		if [ $reinicio == "r" ]; then
			sudo reboot now
		fi
	fi

	#Condición si el usuario quiere instalar y configurar el ECM
	if [ $op -eq 2 ]; then
		#Actualizacion del sistema
		sudo apt-get update
		sudo apt-get upgrade
		#Instalacion de MariaDB
		sudo apt-get install mariadb-server
		clear
		echo Desea correr el instalar seguro de MySQL: s/n
		read op1
		#Opcion para correr el instalador seguro de mysql
		if [ $op1 == "s" ]; then
			clear
			sudo mysql_secure_installation
		fi
		#Seccion para Instalar LAMP, phpmyadmin y servidor FTP
		sudo apt-get install apache2 
		sudo apt-get install php libapache2-mod-php php-mysql
		sudo apt-get install phpmyadmin
		sudo apt-get install vsftpd
		sudo apt-get install python3-pip
		clear
		#Copia la configurar establecida al directorio raiz
		echo Configurando el servicio FTP
		sudo rm -rf /etc/vsftpd.conf
		sudo cp ~/instalador/Proyecto/ECM/Conf-FTP/vsftpd.conf /etc/
		clear
		echo Configurando la IP a 10.0.0.20
		sudo rm -rf /etc/dhcpcd.conf
		sudo cp ~/instalador/Proyecto/ECM/Conf-Eth/dhcpcd.conf /etc/
		clear
		echo Configurando MariaDB
		sudo rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
		sudo cp ~/instalador/Proyecto/ECM/Conf-MariaDB/50-server.cnf /etc/mysql/mariadb.conf.d/
		echo Configurando el SSH para ECM
		sudo rm -rf /etc/ssh/sshd_config
		sudo cp ~/instalador/Proyecto/ECM/Conf-SSH/sshd_config /etc/ssh/
		cd ~/
		#Clona el ropositorio ECM-COMTECO y lo instala
		cd ~/
		git clone https://github.com/javisolis123/ECM-COMTECO.git
		cd ~/ECM-COMTECO/
		source bin/activate
		#Actualiza PIP3
		pip3 install --upgrade pip
		#Instala dependencias del entorno virtual
		pip3 install -r requirements.txt
		#Instala la libreria para ADS1015
		pip3 install adafruit-circuitpython-ads1x15
		deactivate
		#Clona el repositorio ECM-FLASK-SERVER y lo instala
		cd ~/
		git clone https://github.com/javisolis123/ECM-FLASK-SERVER.git
		cd ~/ECM-FLASK-SERVER/
		source bin/activate
		pip3 install -r requirements.txt
		deactivate
		cd ~/
		git clone https://github.com/javisolis123/ECM-SUPERVISOR.git
		cd ~/ECM-SUPERVISOR/
		source bin/activate
		pip3 install -r requirements.txt
		deactivate		
		clear
		echo Es necesario reiniciar el dispositivo
		echo -e
		echo NOTA: LA IP POR DEFECTO ES LA 192.168.10.10 SSH_Puerto: 23
		echo -e
		echo Presione la tecla r para reiniciar o cualquier otra para saltar este paso
		read reinicio
		if [ $reinicio == "r" ]; then
			sudo reboot now
		fi
	fi

	#Condición si el usuario quiere instalar y configurar el CCM
	if [ $op -eq 3 ]; then
		#Actualizacion del sistema
		sudo apt-get update
		sudo apt-get upgrade
		#Instalacion de MariaDB
		sudo apt-get install mariadb-server
		clear
		echo Desea correr el instalar seguro de MySQL: s/n
		read op1
		#Opcion para correr el instalador seguro de mysql
		if [ $op1 == "s" ]; then
			clear
			sudo mysql_secure_installation
		fi
		#Seccion para Instalar LAMP, phpmyadmin y servidor FTP
		sudo apt-get install apache2 
		sudo apt-get install php libapache2-mod-php php-mysql
		sudo apt-get install phpmyadmin
		sudo apt-get install vsftpd
		sudo apt-get install python3-pip
		clear
		#Copia la configurar establecida al directorio raiz
		#echo Configurando el servicio FTP
		#sudo rm -rf /etc/vsftpd.conf
		#sudo cp ~/instalador/Proyecto/ECM/Conf-FTP/vsftpd.conf /etc/
		#clear
		#echo Configurando la IP a 10.0.0.20
		#sudo rm -rf /etc/dhcpcd.conf
		#sudo cp ~/instalador/Proyecto/ECM/Conf-Eth/dhcpcd.conf /etc/
		#clear
		#echo Configurando MariaDB
		#sudo rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
		#sudo cp ~/instalador/Proyecto/ECM/Conf-MariaDB/50-server.cnf /etc/mysql/mariadb.conf.d/
		#echo Configurando el SSH para ECM
		#sudo rm -rf /etc/ssh/sshd_config
		#sudo cp ~/instalador/Proyecto/ECM/Conf-SSH/sshd_config /etc/ssh/
		cd ~/
		#Clona el ropositorio ECM-COMTECO y lo instala
		cd ~/
		git clone https://github.com/javisolis123/ECM-COMTECO.git
		cd ~/ECM-COMTECO/
		source bin/activate
		#Actualiza PIP3
		pip3 install --upgrade pip
		#Instala dependencias del entorno virtual
		pip3 install -r requirements.txt
		#Instala la libreria para ADS1015
		pip3 install adafruit-circuitpython-ads1x15
		deactivate
		#Clona el repositorio ECM-FLASK-SERVER y lo instala
		cd ~/
		git clone https://github.com/javisolis123/ECM-FLASK-SERVER.git
		cd ~/ECM-FLASK-SERVER/
		source bin/activate
		pip3 install -r requirements.txt
		deactivate
		cd ~/
		git clone https://github.com/javisolis123/ECM-SUPERVISOR.git
		cd ~/ECM-SUPERVISOR/
		source bin/activate
		pip3 install -r requirements.txt
		deactivate		
		clear
		echo Es necesario reiniciar el dispositivo
		echo -e
		echo NOTA: LA IP POR DEFECTO ES LA 192.168.10.10 SSH_Puerto: 23
		echo -e
		echo Presione la tecla r para reiniciar o cualquier otra para saltar este paso
		read reinicio
		if [ $reinicio == "r" ]; then
			sudo reboot now
		fi
        
		cd ~/
		git clone https://github.com/javisolis123/Flask-WebServer.git
		cd ~/
		git clone https://github.com/javisolis123/CCM-supervisor.git
	fi

	#Opcion para cerrar el script
	if [ $op -eq 4 ]; then
		clear
		exit
	fi
done