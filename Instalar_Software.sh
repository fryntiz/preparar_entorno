#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

############################
##   Constantes Colores   ##
############################
amarillo="\033[1;33m"
azul="\033[1;34m"
blanco="\033[1;37m"
cyan="\033[1;36m"
gris="\033[0;37m"
magenta="\033[1;35m"
rojo="\033[1;31m"
verde="\033[1;32m"

#############################
##   Variables Generales   ##
#############################
software=$(cat Software.lst) #Instala software del S.O.
atom=$(cat Atom_Paquetes.lst) #Instala Paquetes de Atom

#Instala complementos para Atom IDE
function atom_install() {
	if [ -f /usr/bin/atom ]
	then
		echo -e "$verde Ya esta$rojo ATOM$verde instalado en el equipo, omitiendo paso$gris"
	else
		REINTENTOS=3
		echo -e "$verde Descargando$rojo ATOM$gris"
		for (( i=1; i<=$REINTENTOS; i++ ))
		do
			wget https://atom.io/download/deb && mv deb atom.deb && break
		done
		echo -e "$verde Instalando$rojo Atom $gris"
		sudo dpkg -i atom.deb && sudo apt install -f -y
	fi

    echo -e "$verde Preparando instalación complementos$rojo Atom$gris"
    for p in $atom
    do
        echo -e "$verde Instalando$rojo $p $yellow"
        apm install $p
    done
}

#Instala complementos para Brackets IDE
function brackets_install () {
	if [ -f /usr/bin/brackets ]
	then
		echo -e "$verde Ya esta$rojo Brackets$verde instalado en el equipo, omitiendo paso$gris"
	else
		REINTENTOS=3
		echo -e "$verde Descargando$rojo Brackets$gris"
		for (( i=1; i<=$REINTENTOS; i++ ))
		do
			wget https://github.com/adobe/brackets/releases/download/release-1.11/Brackets.Release.1.11.64-bit.deb
		done
		echo -e "$verde Preparando para instalar$rojo Brackets$gris"
		sudo dpkg -i Brackets.Release.1.11.64-bit.deb && sudo apt install -f -y
	fi
}

#Instala el editor de Base de Datos Dbeaver
function dbeaver_install() {
	if [ -f /usr/bin/dbeaver ]
	then
		echo -e "$verde Ya esta$rojo Dbeaver$verde instalado en el equipo, omitiendo paso$gris"
	else
		REINTENTOS=3
		echo -e "$verde Descargando$rojo Dbeaver$gris"
		for (( i=1; i<=$REINTENTOS; i++ ))
		do
			wget https://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb && break
		done
		echo -e "$verde Preparando para instalar$rojo Dbeaver$gris"
		sudo dpkg -i dbeaver-ce_latest_amd64.deb && sudo apt install -f -y
	fi
}

#Instala el editor de python Ninja IDE
function ninjaide_install() {
	if [ -f /usr/bin/ninja-ide ]
	then
		echo -e "$verde Ya esta$rojo Ninja IDE$verde instalado en el equipo, omitiendo paso$gris"
	else
		REINTENTOS=3
		echo -e "$verde Descargando$rojo Ninja IDE$gris"
		for (( i=1; i<=$REINTENTOS; i++ ))
		do
			wget http://ftp.es.debian.org/debian/pool/main/n/ninja-ide/ninja-ide_2.3-2_all.deb && break
		done
		echo -e "$verde Preparando para instalar$rojo Ninja IDE$gris"
		sudo dpkg -i ninja-ide_2.3-2_all.deb && sudo apt install -f -y
	fi

	#Resolviendo dependencia de libreria QtWebKit.so si no existe
	if [ ! -f /usr/lib/python2.7/dist-packages/PyQt4/QtWebKit.so ]
	then
		echo -e "$verde Añadiendo libreria$rojo QtWebKit$gris"
		sudo mkdir -p /usr/lib/python2.7/dist-packages/PyQt4/ 2>> /dev/null
		sudo cp ./LIB/usr/lib/python2.7/dist-packages/PyQt4/QtWebKit.so /usr/lib/python2.7/dist-packages/PyQt4/
	fi
}

#Recorrer "Software.lst" Instalando paquetes ahí descritos
function instalar_Software() {
	echo "Actualizando listas de Repositorios"
	sudo apt update
	sudo apt --fix-broken install 2>>/dev/null
	echo "Instalando Software adicional"
	for s in $software
	do
		echo -e "$verde Preparando para instalar $rojo$s$gris"
		sleep 1
		sudo apt install -y $s
	done

	#Instalaciones de software independiente
	atom_install
    brackets_install
	dbeaver_install
	ninjaide_install

	sudo apt --fix-broken install 2>>/dev/null
	sudo apt install -f -y 2>>/dev/null
}
