#!/bin/bash
if ! [ -d /$HOME/wallpaper-slider-data ] && ! [ -f /usr/local/bin/wallpaper-slider ] && ! [ -f /usr/bin/WallpaperSlider.py ]; then
    echo "wallpaper-slider is not installed"
else
    # requires sudo permissions, run 'sudo sh uninstall.sh'
    rm -rf $HOME/wallpaper-slider-data
    rm /usr/local/bin/wallpaper-slider 
    rm /usr/bin/WallpaperSlider.py

    echo wallpaper-slider-gnome uninstalled successfully!
fi