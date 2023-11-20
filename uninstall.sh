#!/bin/bash

# requires sudo permissions, run 'sudo sh uninstall.sh'
crontab -l | grep -v "@reboot python /usr/bin/WallpaperSlider.py &" | crontab -
rm -r "/usr/local/bin/data"
rm "/usr/local/bin/wallpaper-slider"
rm "/usr/bin/WallpaperSlider.py"
