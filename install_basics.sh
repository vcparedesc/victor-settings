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
sudo apt install meld -y
sudo apt install konsole -y
sudo apt install minicom -y
sudo apt install emacs -y
sudo apt install shutter -y
sudo apt install inkscape -y
sudo apt install kicad -y
sudo apt install valgrind -y
sudo apt install cmake -y
sudo apt install clang -y
sudo apt install zsh -y
sudo apt install fonts-powerline -y
sudo apt install g++-6 -y
sudo apt install tmux -y
sudo apt install wine1.6 -y
sudo apt install texlive-full -y

# To provide functionality for elpy:
pip install jedi
pip install flake8
pip install autopep8
pip install yapf
pip install black


sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/jorgenschaefer/pyvenv.git
