#!/bin/bash
echo "$(tput setaf 1)Installation du nouveau .bashrc... $(tput sgr0)"
cd /home/pi/
sudo apt-get update
sudo rm -f /home/pi/.bashrc
wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v2.02/.bashrc
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation...$(tput sgr0)."
