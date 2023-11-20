#!/bin/bash

# requires sudo permissions, run 'sudo sh install.sh'
(crontab -l 2>/dev/null; echo "@reboot python /usr/bin/WallpaperSlider.py &") | crontab -

# copy files to home directory instead, for rw access, copy data into wallpaper-slider file
# checks if files exist in home dir, if wallpaper-slider file is in usr/loca/bin
cp -r "./wallpaper-slider-gnome" ~/
cp "./wallpaper-slider" "/usr/local/bin"
sudo chmod +x /usr/local/bin/wallpaper-slider
cp "./WallpaperSlider.py" "/usr/bin"

echo "wallpaper-slider-gnome installed successfully!"