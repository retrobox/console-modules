# RetroBox Console - Modules

Here, you will find all of our overlay at RetroPie, broken down into several "packages". 
You can install dependencies one by one with the scripts provided for this purpose.  

Some of our packages can work on all versions, you can find them in the `\all_versions` folder.
If you want to install all at once, you can directly use the script `allinone.sh`, available in the root of the repo.

The `allinone.sh` script is able to find your version by checking in `/boot/overlay.json`.  
If you have a issue, contact us.

#### Run this command :

```bash
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/allinone.sh && sudo chmod +x /home/pi/allinone.sh && sudo ./allinone.sh
```

---

#### Manual installation :

⚠️ Warning, the version of the console is important, some plugin does not work on certain version.

To choose your console version, please look at the version at the bottom of the PCB.

Like that :

![alt](http://static.retrobox.tech/img/docs/console_overlay/IMG_0584.JPG)
__License :__

<a  rel="license"  href="http://creativecommons.org/licenses/by-nc-sa/3.0/"><img  alt="Creative Commons License"  style="border-width:0"  src="https://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png"  /></a><br  />This work is licensed under a <a  rel="license"  href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.