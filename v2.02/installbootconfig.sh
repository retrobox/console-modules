#!/bin/bash
echo "$(tput setaf 1)Installation des configs en cours... $(tput sgr0)"
cd /home/pi/
sudo apt-get update
sudo rm -r -f /home/pi/console-modules/
sudo git clone --recursive --depth 1 "https://github.com/retrobox/console-modules/" "/home/pi/console-modules/"
sudo \cp -r /home/pi/console-modules/bootConfig/cmdline.txt /boot/cmdline.txt
sudo \cp -r /home/pi/console-modules/bootConfig/config.txt /boot/config.txt
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation des configs..$(tput sgr0)."
