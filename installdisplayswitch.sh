#!/bin/bash
echo "$(tput setaf 1)Installation de displaySwitch... $(tput sgr0)"
sudo apt-get install unzip
sudo wget http://retrobox.happyblocks.info/archives/displayswitch.zip
unzip displayswitch.zip -d /home/pi/displaySwitch
cd /home/pi/displaySwitch
sudo cp /home/pi/displaySwitch/10-retropie.sh /etc/profile.d/
sudo mkdir /home/pi/displayBoot
sudo cp /home/pi/displaySwitch/displayBoot/config_hdmi.txt /home/pi/displayBoot/
sudo cp /home/pi/displaySwitch/displayBoot/config_lcd.txt /home/pi/displayBoot/
sudo cp /home/pi/displaySwitch/displayBoot/initDisplay.sh /home/pi/displayBoot/
sudo chmod 777 /home/pi/displayBoot/initDisplay.sh
sudo chmod 777 /etc/profile.d/10-retropie.sh
echo "$(tput setaf 2)Fin de l'installation de displaySwitch..$(tput sgr0)."
