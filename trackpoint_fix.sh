#!/bin/bash

echo "This improves the situation with trackpoint in Ubuntu 18.04.\n
        It installs xorg evdev and tweaks it to replace the libinput fuckery.\n
        Probably don't do this if you aren't having trouble with precision on your trackpad.\n
        Also, this has only been tested on Thinkpads trackpoints. Likely it'll work on IBM devices too.\n
        You can check if your product matches using xinput and looking for your trackpoint settings.\n
        Proceed? [y/n]: "
read start

if [ "$start" = "y" ]; then
    echo "Alright, installing xorg packages..."
    sudo apt install xserver-xorg-input-evdev -y
    sudo chmod 322 52-trackpoint-tweaks.conf
    sudo chown root 52-trackpoint-tweaks.conf
    sudo chgrp root 52-trackpoint-tweaks.conf
    sudo cp 52-trackpoint-tweaks.conf /usr/share/X11/xorg.conf.d/
    echo "Now, you have to reboot for changes to take effect :)"
    exit 0
elif [ "$start" = "n" ]; then
    exit 0
else
    echo "Say \"y\" or \"n\" chingada madre!... exiting with errors dude. WTF."
    exit 1
fi
