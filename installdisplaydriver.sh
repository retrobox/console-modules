#!/bin/bash
echo "$(tput setaf 1)Installation du driver ecran... $(tput sgr0)"
git clone https://github.com/swkim01/waveshare-dtoverlays.git
sudo cp waveshare-dtoverlays/waveshare32b-overlay.dtb /boot/overlays/waveshare32b.dtbo
sudo wget https://raw.githubusercontent.com/retrobox/overlay/master/displayDriver/config.txt
sudo cp /home/pi/config.txt /boot/
ls /dev/fb*
sudo apt-get install cmake
git clone https://github.com/tasanakorn/rpi-fbcp
cd rpi-fbcp/
mkdir build
cd build/
cmake ..
make
sudo install fbcp /usr/local/bin/fbcp
sudo wget https://raw.githubusercontent.com/retrobox/overlay/master/displayDriver/rc.local
sudo cp /home/pi/rc.local /etc/
sudo reboot
echo "$(tput setaf 2)Fin de l'installation...$(tput sgr0)."
