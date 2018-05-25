#!/bin/bash
echo "$(tput setaf 1)Installation de Websocket... $(tput sgr0)"
sudo apt-get install unzip
sudo wget http://retrobox.happyblocks.info/archives/setuptools-39.0.1.zip
unzip setuptools-39.0.1.zip -d /home/pi/setuptools-39.0.1
wget http://retrobox.happyblocks.info/archives/websocket_client-0.47.0.tar.gz
tar -xvzf websocket_client-0.47.0.tar.gz
sudo apt-get install python3-pip
cd /home/pi/
cd /home/pi/setuptools-39.0.1/setuptools-39.0.1
sudo python setup.py install
cd /home/pi/websocket_client-0.47.0
sudo python setup.py install
echo "$(tput setaf 2)Fin de l'installation de WebSocket, de python, de pip et de setuptools..$(tput sgr0)."
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
echo "$(tput setaf 2)Fin de l'installation...$(tput sgr0)."
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
echo "$(tput setaf 1)Installation du theme en cours... $(tput sgr0)"
git clone --recursive --depth 1 "https://github.com/retrobox/overlay/themeRetroBox" "/etc/emulationstation/themes/retrobox_theme"
echo "$(tput setaf 2)Fin de l'installation du theme..$(tput sgr0)."
