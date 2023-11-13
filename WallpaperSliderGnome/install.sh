#!/bin/bash

# requires sudo permissions, run 'sudo sh install.sh'
sudo cp -r "./data" "/usr/local/bin"
sudo cp "./wallpaper-slider" "/usr/local/bin"
sudo chmod +x /usr/local/bin/wallpaper-slider
sudo cp "./WallpaperSlider.py" "/user/bin"
sudo (crontab -l 2>/dev/null; echo "@reboot python /usr/bin/WallpaperSlider.py &") | crontab -