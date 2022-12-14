#!/bin/bash

# Configure git
git config --global user.email "yahiralejandros@gmail.com"
git config --global user.name "Yahir"

# VSCode via Snap
sudo snap install --classic code

# update package manager
sudo apt-get update

# install i3wm
sudo apt-get install i3 -y

# install xsecurelock
sudo apt-get install xsecurelock -y

# install Rofi
sudo apt-get install rofi -y

# install feh
sudo apt-get install feh -y

# exFAT utilities
sudo apt-get install exfat-fuse exfatprogs