#!/bin/bash
echo "$(tput setaf 1)Installation du splashscreen en cours... $(tput sgr0)"
cd /home/pi/
sudo apt-get update
sudo rm -r -f /home/pi/console-modules/
sudo git clone --recursive --depth 1 "https://github.com/retrobox/console-modules/" "/home/pi/console-modules/"
sudo \cp -r /home/pi/console-modules/v2.02/bootConfig/cmdline.txt /boot/cmdline.txt
sudo \cp -r /home/pi/console-modules/v2.02/bootConfig/config.txt /boot/config.txt
sudo rm -r -f /home/pi/RetroPie/splashscreens/video/retrobox_splashscreen.mp4
sudo rm -r -f /home/pi/RetroPie/splashscreens/video/
mkdir /home/pi/RetroPie/splashscreens/video/
sudo \cp -r /home/pi/console-modules/v2.02/themeRetroBox/retrobox_splashscreen.mp4 /home/pi/RetroPie/splashscreens/video/
sudo sed -i '1s/.*/\/home\/pi\/RetroPie\/splashscreens\/video\/retrobox_splashscreen.mp4/' /etc/splashscreen.list
sudo rm -r -f /etc/motd
sudo touch /etc/motd
sudo sed -i '28s/.*/ExecStart=-\/sbin\/agetty --skip-login --noclear --noissue --login-options "-f pi" %I $TERM/' /etc/systemd/system/autologin@.service
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation du splashscreen..$(tput sgr0)."
