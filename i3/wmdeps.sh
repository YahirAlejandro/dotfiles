#!/bin/bash

# Configure git
git config --global user.email "yahiralejandros@gmail.com"
git config --global user.name "Yahir"

# SNAP PACKAGES------------------
# VSCode
sudo snap install --classic code

# Spotify
sudo snap install spotify

# Telegram
sudo snap install telegram-desktop

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
sudo apt-get install exfat-fuse exfatprogs -y

# Golang
sudo apt install golang -y

# DuckDuckGo
sudo apt-get install ddgr -y

# CUSTOMIZATION----------------------------

# Wallpaper
sudo apt-get install wget -y
wget https://i.redd.it/zgedma244ya81.png -P ~/Documents/
feh --bg-scale ~/Documents/zgedma244ya81.png