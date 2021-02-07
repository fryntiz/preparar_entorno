#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      raul@fryntiz.dev
## @web        https://fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Applied Style Guide:
## @style      https://gitlab.com/fryntiz/bash-guide-style

############################
##      INSTRUCTIONS      ##
############################

##
## Configurar editor de gnome, gedit
##
usuario_gedit() {
    echo -e "$VE Configurando$RO Gedit$CL"
    local WORKDIR_GEDIT="$WORKSCRIPT/conf/Apps/gedit"

    if [[ ! -d "$HOME/.local/share" ]]; then
        mkdir -p "$HOME/.local/share/"
    fi
    cp -r $WORKDIR_GEDIT/.local/share/* "$HOME/.local/share/"

    if [[ ! -d "$HOME/.config/gedit/" ]]; then
        mkdir -p "$HOME/.config/gedit/"
    fi
    cp -r $WORKDIR_GEDIT/.config/gedit/* "$HOME/.config/gedit/"
}
