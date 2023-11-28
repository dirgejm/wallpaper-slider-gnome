# python3

import os
from os import listdir
from os.path import isfile, join
import time
import random
from os.path import expanduser

home = expanduser("~")
index = 0

with open(f"{home}/wallpaper-slider-data/data/path.txt", "r") as file:
    pics = file.readline()
pics = pics.replace("\n", "")

# ensures path is full path
if not pics.endswith("/"):
    PICS = f"{pics}/"
else:
    PICS = pics

with open(f"{home}/wallpaper-slider-data/data/delay.txt", "r") as file:
    delay = file.readline()
delay = delay.replace("\n", "")

# translates delay from format ex. "2m" to/opt/auto-cpufreq/venv 120 seconds for change_background
def translate_delay(delay):
    minute = 60
    hour = 3600
    day = 86400
    
    if delay.endswith("m") == True:
        delay = delay.removesuffix("m")
        delay = int(delay) * minute
        return delay
    elif delay.endswith("h") == True:
        delay = delay.removesuffix("h")
        delay = int(delay) * hour
        return delay
    elif delay.endswith("d") == True:
        delay = delay.removesuffix("d")
        delay = int(delay) * day
        return delay
    else:
        return ValueError

def change_background(PICS, delay, index):
    URI = "file://"
    COMMAND_LIGHT = "gsettings set org.gnome.desktop.background picture-uri "
    COMMAND_DARK = "gsettings set org.gnome.desktop.background picture-uri-dark "
    
    wallpapers = [f for f in listdir(PICS) if isfile(join(PICS, f))]
    random.shuffle(wallpapers)
    
    while True:
        if index % len(wallpapers) == 0:
            index = 0

        image = wallpapers[index]
        
        os.system(f"{COMMAND_LIGHT}{URI}{PICS}{image}")
        os.system(f"{COMMAND_DARK}{URI}{PICS}{image}")
        
        time.sleep(delay)
        
        index += 1

if __name__ == "__main__":
    
    DELAY = translate_delay(delay)
    change_background(PICS, DELAY, index)