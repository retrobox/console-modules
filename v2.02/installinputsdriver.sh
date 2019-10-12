#!/bin/bash
echo "$(tput setaf 1)Installation du driver inputs... $(tput sgr0)"
cd /home/pi/
sudo rm -r -f /home/pi/mkjoystick/
mkdir mkjoystick
cd mkjoystick
sudo wget -N https://github.com/recalbox/mk_arcade_joystick_rpi/releases/download/v0.1.5/install.sh
sudo sh ./install.sh
sudo rm -r -f /home/pi/console-modules/
sudo git clone --recursive --depth 1 "https://github.com/retrobox/console-modules/" "/home/pi/console-modules/"
sudo \cp -r /home/pi/console-modules/v2.02/inputsDriver/etc/modules /etc/modules
sudo \cp -r /home/pi/console-modules/v2.02/inputsDriver/etc/modprobe.d/mk_arcade_joystick_rpi.conf /etc/modprobe.d/
sudo \cp -r /home/pi/console-modules/v2.02/inputsDriver/etc/modprobe.d/mk_arcade_joystick.conf /etc/modprobe.d/
sudo \cp -r /home/pi/console-modules/v2.02/inputsDriver/opt/retropie/configs/all/emulationstation/es_input.cfg /opt/retropie/configs/all/emulationstation/
sudo \cp -r -a /home/pi/console-modules/v2.02/inputsDriver/opt/retropie/configs/all/retroarch/autoconfig/. /opt/retropie/configs/all/retroarch/autoconfig/
sudo \cp -r -a /home/pi/console-modules/v2.02/inputsDriver/opt/retropie/configs/all/retroarch-joypads/. /opt/retropie/configs/all/retroarch-joypads/
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation... Redémarrage$(tput sgr0)."
sudo reboot
