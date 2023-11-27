#!/bin/bash

# checks if files exist in home dir, if wallpaper-slider file is in usr/loca/bin
if [ -d /$HOME/wallpaper-slider-data ] && [ -f /usr/local/bin/wallpaper-slider ] && [ -f /usr/bin/WallpaperSlider.py ]; then
    echo "wallpaper-slider installed with version $(<$HOME/wallpaper-slider-data/data/version.txt)"
# elif [ -d /$HOME/wallpaper-slider-data ] || [ -f /usr/local/bin/wallpaper-slider ] || [ -f /usr/bin/WallpaperSlider.py ]; then
#     echo  wallpaper-slider error, not fully installed correctly or files misplaced. Recommended run 'sudo sh uninstall.sh' 'sudo sh install.sh'
else
    # requires sudo permissions, run 'sudo sh install.sh'
    cp -r ./wallpaper-slider-data $HOME
    cp wallpaper-slider /usr/local/bin
    chmod +x /usr/local/bin/wallpaper-slider
    chmod +rw $HOME/wallpaper-slider-data
    cp WallpaperSlider.py /usr/bin
    echo wallpaper-slider-gnome installed successfully!
fi