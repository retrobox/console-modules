#!/bin/bash
echo "$(tput setaf 1)Installation des composantes de RetroBox... $(tput sgr0)"
cd /home/pi/
sudo apt-get update
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/installdisplaydriver.sh && sudo chmod +x /home/pi/installdisplaydriver.sh && sudo ./installdisplaydriver.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/installwebsocket.sh && sudo chmod +x /home/pi/installwebsocket.sh && sudo ./installwebsocket.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/installdisplayswitch.sh && sudo chmod +x /home/pi/installdisplayswitch.sh && sudo ./installdisplayswitch.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/installretroboxtheme.sh && sudo chmod +x /home/pi/installretroboxtheme.sh && sudo ./installretroboxtheme.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/installbashrc.sh && sudo chmod +x /home/pi/installbashrc.sh && sudo ./installbashrc.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/installinputsdriver.sh && sudo chmod +x /home/pi/installinputsdriver.sh && sudo ./installinputsdriver.sh
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation.. Redémarrage$(tput sgr0)."
sudo reboot
