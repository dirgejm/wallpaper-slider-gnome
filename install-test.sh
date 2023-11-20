#!/bin/bash

# need to check if files exist
if [ -d "/$HOME/wallpaper-slider-gnome" ] && [ -f "/usr/local/bin/wallpaper-slider" ] && [ -f "/usr/bin/WallpaperSlider.py" ]; then
    echo "wallpaper-slider installed with version $(</usr/local/bin/data/version.txt)"
fi