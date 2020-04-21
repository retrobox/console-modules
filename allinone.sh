#!/bin/bash
echo -e "
\e[31m                                                    _______          _     
\e[31m       ____       __             ____              |__   __|        | |  
\e[33m      / __ \___  / /__________  / __ )____  _  __     | | ___   ___ | |___ 
\e[32m     / /_/ / _ \/ __/ ___/ __ \/ __  / __ \| |/_/     | |/ _ \ / _ \| / __|  
\e[36m    / _, _/  __/ /_/ /  / /_/ / /_/ / /_/ />  <       | | (_) | (_) | \__ \  
\e[34m   /_/ |_|\___/\__/_/   \____/_____/\____/_/|_|       |_|\___/ \___/|_|___/  v1.0
\e[97m
 \e[35m Welcome in the automatic installation script. I hope you know what you are doing...
"

FILE=/boot/overlay.json
cd /home/pi/

if [ -f "$FILE" ]; then
    echo "$(tput sgr0)$FILE $(tput setaf 2)have been found, please wait$(tput sgr0)..." 
    if grep -q 2.02 "$FILE"; then
        echo "$(tput setaf 2)V2.06 detected, installing proper package...$(tput sgr0)"
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/all_versions/installretroboxtheme.sh && sudo chmod +x /home/pi/installretroboxtheme.sh && sudo ./installretroboxtheme.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v2.02/installbashrc.sh && sudo chmod +x /home/pi/installbashrc.sh && sudo ./installbashrc.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/all_versions/installnode && sudo chmod +x /home/pi/installnode.sh && sudo ./installnode.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/all_versions/overlay.sh && sudo chmod +x /home/pi/overlay.sh && sudo ./overlay.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v2.02/installinputsdriver.sh && sudo chmod +x /home/pi/installinputsdriver.sh && sudo ./installinputsdriver.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v2.02/installdisplaydriver.sh && sudo chmod +x /home/pi/installdisplaydriver.sh && sudo ./installdisplaydriver.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v2.02/installdisplayswitch.sh && sudo chmod +x /home/pi/installdisplayswitch.sh && sudo ./installdisplayswitch.sh
        sudo reboot -n
    elif grep -q 3.06 "$FILE"; then
        echo "$(tput setaf 2)V3.06 detected, installing proper package...$(tput sgr0)"
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/all_versions/installretroboxtheme.sh && sudo chmod +x /home/pi/installretroboxtheme.sh && sudo ./installretroboxtheme.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v3.06/installbashrc.sh && sudo chmod +x /home/pi/installbashrc.sh && sudo ./installbashrc.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/all_versions/installnode && sudo chmod +x /home/pi/installnode.sh && sudo ./installnode.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/all_versions/overlay.sh && sudo chmod +x /home/pi/overlay.sh && sudo ./overlay.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v3.06/installinputsdriver.sh && sudo chmod +x /home/pi/installinputsdriver.sh && sudo ./installinputsdriver.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v3.06/installdisplaydriver.sh && sudo chmod +x /home/pi/installdisplaydriver.sh && sudo ./installdisplaydriver.sh
        sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/v3.06/installdisplayswitch.sh && sudo chmod +x /home/pi/installdisplayswitch.sh && sudo ./installdisplayswitch.sh
        sudo reboot -n
    else
        echo "$(tput setaf 2)Unknow console version, check into $(tput sgr0)/boot/overlay.json"
    fi
fi
echo "$(tput setaf 2)End of the installation... $(tput sgr0)Restarting..."  