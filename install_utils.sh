#!/bin/sh

# This is supposed to install a lot of packages that I use a lot

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

# Cool Retro Term
sudo add-apt-repository ppa:vantuz/cool-retro-term
sudo apt update -y
sudo apt install cool-retro-term -y