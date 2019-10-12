#!/bin/bash
echo "$(tput setaf 1)Installation du loading menu... $(tput sgr0)"
cd /home/pi/
sudo apt-get update
sudo rm -r -f /home/pi/es-runcommand-splash/
sudo git clone --recursive --depth 1 "https://github.com/ehettervik/es-runcommand-splash" "/home/pi/es-runcommand-splash/"
sudo \cp -avr /home/pi/es-runcommand-splash/ /opt/retropie/configs/
sudo sed -i '1s/.*/use_art = "1"/' /opt/retropie/configs/all/runcommand.cfg
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation du loading menu..$(tput sgr0)."
