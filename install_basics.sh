#!/bin/sh
# Lima Bionics basic folders outline

cd ~/Downloads
wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run &
wget https://www.arduino.cc/download_handler.php &
wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/oxygen/R/eclipse-cpp-oxygen-R-linux-gtk-x86_64.tar.gz &

cd -
sudo apt update
sudo apt upgrade

sudo apt install git -y
sudo apt install konsole -y
sudo apt install minicom -y
sudo apt install emacs24 -y
sudo apt install shutter -y
sudo apt install inkscape -y
sudo apt install kicad -y
sudo apt install valgrind -y
sudo apt install cmake -y
sudo apt install clang -y

