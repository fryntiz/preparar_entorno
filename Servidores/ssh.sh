#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
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

ssh_descargar() {
    echo -e "$VE Descargando$RO ssh$CL"
}

ssh_preconfiguracion() {
    echo -e "$VE Generando Pre-Configuraciones de$RO ssh$CL"
}

ssh_instalar() {
    echo -e "$VE Instalando$RO ssh$CL"
    instalarSoftware 'ssh'

    echo -e "$VE Instalando paquetes complementarios de$RO ssh$CL"
    local complementarios='sshpass ssh-cron ssh-askpass'
    instalarSoftware "$complementarios"
}

ssh_postconfiguracion() {
    echo -e "$VE Generando Post-Configuraciones de$RO ssh$CL"
    local sshd='/etc/ssh/sshd_config'

    if [[ -f '/etc/ssh/sshd_config' ]]; then
        ## Inactividad → 30 minutos, pregunta 3 veces (cada 10 minutos)
        sudo sed -r -i "s/^#?\s*ClientAliveInterval.*$/ClientAliveInterval 36000/" $sshd
        sudo sed -r -i "s/^#?\s*ClientAliveCountMax.*$/ClientAliveCountMax 3/" $sshd
        sudo sed -r -i "s/^#?\s*TCPKeepAlive.*$/TCPKeepAlive yes/" $sshd
    fi
}

ssh_instalador() {
    ssh_descargar
    ssh_preconfiguracion
    ssh_instalar
    ssh_postconfiguracion
}