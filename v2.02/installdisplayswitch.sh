#!/bin/bash
echo "$(tput setaf 1)Installation de displaySwitch... $(tput sgr0)"
cd /home/pi/
sudo apt-get update
sudo rm -r -f /home/pi/console-modules/
sudo git clone --recursive --depth 1 "https://github.com/retrobox/console-modules/" "/home/pi/console-modules/"
sudo \cp -r /home/pi/console-modules/v2.02/displaySwitch/10-retropie.sh /etc/profile.d/
sudo rm -r -f /home/pi/displayBoot/
sudo mkdir /home/pi/displayBoot
sudo cp /home/pi/console-modules/v2.02/displaySwitch/displayBoot/config_hdmi.txt /home/pi/displayBoot/
sudo cp /home/pi/console-modules/v2.02/displaySwitch/displayBoot/config_lcd.txt /home/pi/displayBoot/
sudo cp /home/pi/console-modules/v2.02/displaySwitch/displayBoot/initDisplay.sh /home/pi/displayBoot/
sudo chmod 777 /home/pi/displayBoot/initDisplay.sh
sudo chmod 777 /etc/profile.d/10-retropie.sh
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation de displaySwitch.. Redémarrage$(tput sgr0)."
sudo reboot
