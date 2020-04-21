# RetroBox Theme

This is the official theme for the RetroBox console, simple and beautiful.

---
Install with :

```bash
sudo wget -N https://raw.githubusercontent.com/retrobox/console-modules/master/all_versions/installretroboxtheme.sh && sudo chmod +x /home/pi/installretroboxtheme.sh && sudo ./installretroboxtheme.sh
```

Actually, we need to split into two different folders the theme ? Why ?

- When you connect a HDMI TV/screen into the console, the resolution is higher than the screen on the console, so as we can display more things into a big screen, we have split it to give to the user a full good experience with our console.

If you want to manually the theme, simply put these folders into `/etc/emulationstation/themes/` and if you send files over SFTP, you will need to change the permission of the folder, do that with : 
```bash
sudo chmod 777 -R /etc/emulationstation/themes/
```

There is also the splashscreen here, put the file `retrobox_splashscreen` in `/home/pi/RetroPie/splashscreens/video/`.

---

### Updates

*20/04/2020*
- asap

*04/04/2019*
- Added display of marquee image
- Cleaned up layout of metadata
- Added basic styling of carousel


# Preview

## Video Walkthrough
A.S.A.P

## Screenshots

#### *Home*  
![alt](https://cdn.discordapp.com/attachments/401860648604270612/701849887083593778/home.png)

#### *With a scraped game*  
![alt](https://cdn.discordapp.com/attachments/401860648604270612/701812750418051222/snapshot.png)

#### *Settings menu*  
![alt](https://cdn.discordapp.com/attachments/401860648604270612/701849826744205322/other.png)

## Details

- Has support for system, basic, detailed and video views
- Displays the following metadata on detailed and video views: rating, description, # of players, genre, publish date & last played
- Matching splashscreens are included in the \_inc/images folder