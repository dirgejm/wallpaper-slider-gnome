#!/bin/bash

# checks if files exist in home dir, if wallpaper-slider file is in usr/loca/bin
if [ -d "/$HOME/wallpaper-slider-gnome" ] && [ -f "/usr/local/bin/wallpaper-slider" ] && [ -f "/usr/bin/WallpaperSlider.py" ]; then
    echo "wallpaper-slider installed with version $(</usr/local/bin/data/version.txt)"
elif [ -d "/$HOME/wallpaper-slider-gnome" ] && [ -f "/usr/local/bin/wallpaper-slider" ] && [ -f "/usr/bin/WallpaperSlider.py" ]; then
    echo  "wallpaper-slider error, not fully installed correctly or files misplaced. Recommended run 'sudo sh uninstall.sh' 'sudo sh install.sh'"
else
    # requires sudo permissions, run 'sudo sh install.sh'
    cp -r "./wallpaper-slider-gnome" ~/
    cp "./wallpaper-slider" "/usr/local/bin"
    sudo chmod +x /usr/local/bin/wallpaper-slider
    cp "./WallpaperSlider.py" "/usr/bin"
    (crontab -l 2>/dev/null; echo "@reboot python /usr/bin/WallpaperSlider.py &") | crontab -

    echo "wallpaper-slider-gnome installed successfully!"
fi