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
## Menú principal para instalar aplicaciones desde el que se permite
## elegir entre los tipos de aplicaciones a instalar desde un menú
## interactivo seleccionando el número que le corresponda

############################
##     IMPORTACIONES      ##
############################
source "$WORKSCRIPT/apps/1_Aplicaciones_Basicas.sh"
source "$WORKSCRIPT/apps/2_Aplicaciones_Extras.sh"
source "$WORKSCRIPT/apps/3_Aplicaciones_Usuario.sh"

###########################
##       FUNCIONES       ##
###########################
menuAplicaciones() {
    while true :; do
        clear
        local descripcion='Menú de aplicaciones
            1) Aplicaciones Básicas
            2) Aplicaciones Extras
            3) Aplicaciones de Usuario
            4) Todos los pasos anteriores
        '
        opciones "$descripcion"

        echo -e "$RO"
        read -p "    Acción → " entrada
        echo -e "$CL"

        case $entrada in

            1)  aplicaciones_basicas;;   ## Aplicaciones Básicas
            2)  aplicaciones_extras;;    ## Aplicaciones Extras
            3)  aplicaciones_usuarios;;  ## Aplicaciones de Usuario

            4)  ## Todas las aplicaciones
                echo -e "$VE Instalando todas las aplicaciones$CL"
                aplicaciones_basicas
                aplicaciones_extras
                aplicaciones_usuarios;;

            0)  ## SALIR
                clear
                echo -e "$RO Se sale del menú$CL"
                echo ''
                break;;

            *)  ## Acción ante entrada no válida
                clear
                echo ""
                echo -e "                      $RO ATENCIÓN: Elección no válida$CL";;
        esac
    done
}
