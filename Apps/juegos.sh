#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2019 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      raul@fryntiz.dev
## @web        https://fryntiz.es
## @gitlab     https://gitlab.com/fryntiz
## @github     https://github.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://gitlab.com/fryntiz/bash-guide-style

############################
##     INSTRUCCIONES      ##
############################
##

###########################
##       FUNCIONES       ##
###########################
aplicaciones_juegos() {
    echo -e "$VE Juegos$CL"
    actualizarRepositorios

    repararGestorPaquetes

    instalarSoftwareLista "$SOFTLIST/Juegos/arcade.lst"
    instalarSoftwareLista "$SOFTLIST/Juegos/emuladores.lst"
    instalarSoftwareLista "$SOFTLIST/Juegos/estrategia.lst"
    instalarSoftwareLista "$SOFTLIST/Juegos/mesa.lst"
    instalarSoftwareLista "$SOFTLIST/Juegos/platforms.lst"

    repararGestorPaquetes
}
