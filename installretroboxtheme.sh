#!/bin/bash
echo "$(tput setaf 1)Installation du theme en cours... $(tput sgr0)"
git clone --recursive --depth 1 "https://github.com/retrobox/overlay/" "/home/pi/overlay/"
cd /home/pi/overlay/themeRetroBox/
sudo cp -r /home/pi/overlay/themeRetroBox /etc/emulationstation/themes/retrobox_theme
echo "$(tput setaf 2)Fin de l'installation du theme..$(tput sgr0)."
