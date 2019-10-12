#!/bin/bash
echo "$(tput setaf 1)Installation du nouveau .bashrc... $(tput sgr0)"
cd /home/pi/
sudo apt-get update
wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/.bashrc
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation...$(tput sgr0)."
