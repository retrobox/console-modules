# Check display config
/home/pi/displayBoot/initDisplay.sh
sleep 5

# launch our autostart apps (if we are on the correct tty)
if [ "`tty`" = "/dev/tty1" ]; then
    bash "/opt/retropie/configs/all/autostart.sh"
fi
