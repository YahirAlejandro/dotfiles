#!/bin/bash

# Validate if .gconf dir exists and if not, create it for Guake
if [ ! -d ~/.gconf ]; then
    cp -R $(pwd)/.gconf/ ~
else
    mkdir -p ~/.gconf/apps/guake/general/
    cp $(pwd)/.gconf/apps/guake/general/%gconf.xml ~/.gconf/apps/guake/general/%gconf.xml

    mkdir -p ~/.gconf/apps/guake/style/
    cp $(pwd)/.gconf/apps/guake/style/%gconf.xml ~/.gconf/apps/guake/style/%gconf.xml

    mkdir -p ~/.gconf/apps/guake/style/background/
    cp $(pwd)/.gconf/apps/guake/style/background/%gconf.xml ~/.gconf/apps/guake/style/background/%gconf.xml

    mkdir -p ~/.gconf/apps/guake/style/font/
    cp $(pwd)/.gconf/apps/guake/style/font/%gconf.xml ~/.gconf/apps/guake/style/font/%gconf.xml
fi
