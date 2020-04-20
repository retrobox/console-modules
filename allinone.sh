#!/bin/bash
echo "$(tput setaf 1)Installation des composantes de RetroBox... $(tput sgr0)"
cd /home/pi/
sudo apt-get update
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v2.02/installdisplaydriver.sh && sudo chmod +x /home/pi/installdisplaydriver.sh && sudo ./installdisplaydriver.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/all_version/installnode && sudo chmod +x /home/pi/installnode.sh && sudo ./installnode.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v2.02/installdisplayswitch.sh && sudo chmod +x /home/pi/installdisplayswitch.sh && sudo ./installdisplayswitch.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/all_version/installretroboxtheme.sh && sudo chmod +x /home/pi/installretroboxtheme.sh && sudo ./installretroboxtheme.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v2.02/installbashrc.sh && sudo chmod +x /home/pi/installbashrc.sh && sudo ./installbashrc.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v2.02/installinputsdriver.sh && sudo chmod +x /home/pi/installinputsdriver.sh && sudo ./installinputsdriver.sh
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/all_version/overlay.sh && sudo chmod +x /home/pi/overlay.sh && sudo ./overlay.sh
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation.. Redémarrage$(tput sgr0)."
sudo reboot
