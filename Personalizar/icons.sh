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
## Instala los iconos en el sistema de forma global

############################
##       FUNCIONES        ##
############################

icons_debian() {
    theme_paper() {
        echo -e "$VE Descargando pack de iconos$RO Paper Theme$CL"
        descargar 'Paper_Theme.deb' 'https://launchpadlibrarian.net/468844787/paper-icon-theme_1.5.728-202003121505~daily~ubuntu18.04.1_all.deb'

        echo -e "$VE Instalando iconos$RO Paper_Theme$CL"
        instalarSoftwareDPKG "$WORKSCRIPT/tmp/Paper_Theme.deb"
    }

    theme_paper

    ## Establece iconos Paper en uso
    gconftool-2 --type string --set /desktop/gnome/interface/icon_theme 'Paper'
}

icons_install() {
    echo -e "$VE Instalando iconos personalizados dentro de$RO /usr/share/icons/fryntiz$CL"
    if [[ -d '/usr/share/icons/fryntiz' ]]; then
        sudo rm -Rf '/usr/share/icons/fryntiz'
    fi

    sudo cp -r "$WORKSCRIPT/conf/usr/share/icons/fryntiz" '/usr/share/icons/fryntiz'

    sudo chmod 755 -R '/usr/share/icons/fryntiz'


    if [[ "$DISTRO" = 'debian' ]]; then
        icons_debian
    fi

    if [[ "$DISTRO" = 'raspberry' ]]; then
        icons_debian
    fi

    instalarSoftwareLista "$SOFTLIST/Personalizar/icons.lst"

    ## Lo enlazo para que se usen por defecto con el usuario
    if [[ -d "$HOME/.local/share/icons/default" ]]; then
        rm -Rf "$HOME/.local/share/icons/default"
    fi

    mkdir -p "$HOME/.local/share/icons/default"

    if [[ -d '/usr/share/icons/Paper' ]]; then
        ln -s '/usr/share/icons/Paper/index.theme' "$HOME/.local/share/icons/default/index.theme"
    fi
}
