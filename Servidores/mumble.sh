#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      dev@fryntiz.es
## @web        https://fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/bash-guide-style

############################
##     INSTRUCCIONES      ##
############################

mumble_descargar() {
    echo -e "$VE Descargando$RO mumble$CL"
}

mumble_preconfiguracion() {
    echo -e "$VE Generando Pre-Configuraciones de$RO mumble$CL"
}

mumble_instalar() {
    echo -e "$VE Instalando$RO mumble$CL"
    instalarSoftwareLista "${SOFTLIST}/Servidores/mumble.lst"
}

mumble_postconfiguracion() {
    echo -e "$VE Generando Post-Configuraciones de$RO mumble$CL"
    sudo cat "$WORKSCRIPT/conf/etc/mumble-server.ini" '/etc/mumble-server.ini'
    sudo dpkg-reconfigure mumble-server
}

mumble_instalador() {
    mumble_descargar
    mumble_preconfiguracion
    mumble_instalar
    mumble_postconfiguracion
}
