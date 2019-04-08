#!/bin/bash
echo "$(tput setaf 1)Installation du driver ecran 3.2inch... $(tput sgr0)"
cd /home/pi/
sudo apt-get update
sudo rm -r -f /home/pi/waveshare-dtoverlays/
git clone https://github.com/swkim01/waveshare-dtoverlays.git
sudo cp waveshare-dtoverlays/waveshare32b.dtbo /boot/overlays/waveshare32b.dtbo
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/displayDriver/config.txt
sudo cp /home/pi/config.txt /boot/
ls /dev/fb*
sudo apt-get install cmake
sudo rm -r -f /home/pi/rpi-fbcp/
git clone https://github.com/tasanakorn/rpi-fbcp
cd rpi-fbcp/
mkdir build
cd build/
cmake ..
make
sudo install fbcp /usr/local/bin/fbcp
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/displayDriver/rc.local
sudo cp /home/pi/rc.local /etc/
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation... Redémarrage$(tput sgr0)."
sudo reboot
