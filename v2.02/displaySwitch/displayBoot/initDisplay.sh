#!/bin/bash

# HDMI connection?

rm -f hdmi.name
tvservice -n 2> hdmi.name

if grep "No device present" hdmi.name; then
    if ! grep "#lcd_on" /boot/config.txt; then
        /bin/echo -e "\e[31mRedemarrage sur l'ecran LCD\e[0m"
        sudo sed -i '41s/.*/<string name="ThemeSet" value="retrobox_smalltheme" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
        sudo cp -f /home/pi/displayBoot/config_lcd.txt /boot/config.txt
        sudo reboot -n
    fi
else
    if ! grep "#lcd_off" /boot/config.txt; then
        /bin/echo -e "\e[31mRedemarrage sur l'HDMI\e[0m"
        sudo sed -i '41s/.*/<string name="ThemeSet" value="retrobox_theme" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
        sudo cp -f /home/pi/displayBoot/config_hdmi.txt /boot/config.txt
        sudo reboot -n
    fi
fi
