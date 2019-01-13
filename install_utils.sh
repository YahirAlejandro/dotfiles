#!/bin/bash

# This is supposed to install a bunch of packages that I use a lot

set -e

if [ "$(id -u)" = "0" ]; then
    echo "WARNING: It might not be the best to run this as root."
    echo "You will be prompted many times on sudo and confirmations commands anyways."
    while true; do
        read -p "Do you want to continue as root?" yn
        case $yn in
        [Yy]* ) continue; break;;
        [Nn]* ) echo "Relauch this as your user"; exit 0;;
        * ) echo "Please answer y or n";;
        esac
    done
else
    echo "This will prompt you many times if you want to install. Keep an eye on it."
    sleep 3
fi

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman

# Postman Unity Desktop file
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

# Gnome log viewer
sudo apt install gnome-system-log -y

# Cool Retro Term
sudo add-apt-repository ppa:vantuz/cool-retro-term
sudo apt update -y
sudo apt install cool-retro-term -y

# Flatpak
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update -y
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Telegram
sudo snap install telegram-desktop

# Spotify
sudo snap install spotify

# VSCode
sudo snap install vscode --classic

# Albert
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt-get update
sudo apt-get install albert

if [ ! -d ~/.config]; then
    mkdir ~/.config
fi
cp -rf albert ~/.config/
albert &

# Golang
sudo apt install golang -y

# gcloud SDK and kubectl are also available as non-release Snaps using the --classic flag when installing

# gcloud SDK
# Create environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk

# Kubectl
sudo apt install kubectl -y

# Docker
sudo apt install docker.io -y
sudo usermod -aG docker $USER
newgrp docker # This might prevent further script execution