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

# cURL
sudo apt-get install curl -y

# install i3wm
sudo apt-get install i3 -y

# install xsecurelock
sudo apt-get install xsecurelock -y

# install Rofi
# TODO: Track config files
sudo apt-get install rofi -y

# install feh
sudo apt-get install feh -y

# exFAT utilities
sudo apt-get install exfat-fuse exfatprogs -y

# Golang
sudo apt install golang -y

# DuckDuckGo
sudo apt-get install ddgr -y

# ZSH
sudo apt install zsh -y

# ZSH config
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cerebro
# TODO: Track config files
curl -LOJR https://github.com/cerebroapp/cerebro/releases/download/v0.10.0/cerebro_0.10.0_amd64.deb
sudo chmod +x cerebro_0.10.0_amd64.deb
sudo dpkg -i cerebro_0.10.0_amd64.deb
rm cerebro_0.10.0_amd64.deb
# TODO: Fetch pre-existing config files if any, implement
nohup cerebro > /dev/null 2>&1 &

# CUSTOMIZATION----------------------------

# Wallpaper
sudo apt-get install wget -y
wget https://i.redd.it/zgedma244ya81.png -P ~/Documents/
feh --bg-scale ~/Documents/zgedma244ya81.png