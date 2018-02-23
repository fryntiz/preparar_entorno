#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2017 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      tecnico@fryntiz.es
## @web        www.fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################

############################
##        FUNCIONES       ##
############################

nodejs_descargar() {
    echo "$VE Descargando$RO nodejs$CL"
}

nodejs_preconfiguracion() {
    echo -e "$VE Generando Pre-Configuraciones de$RO nodejs"
}

nodejs_instalar() {
    echo -e "$VE Instalando$RO nodejs$CL"
}

nodejs_postconfiguracion() {
    echo -e "$VE Generando Post-Configuraciones de nodejs"
}


nodejs_instalador() {
    nodejs_descargar
    nodejs_preconfiguracion
    nodejs_instalar
    nodejs_postconfiguracion
}