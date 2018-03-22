#!/bin/sh
# Lima Bionics basic folders outline
cd ~
cd Documents
mkdir -p LimaBionics
cd LimaBionics
mkdir -p mechanics
mkdir -p programming
mkdir -p electronics
cd electronics

# Electronic's Folder
if [ ! -d $HOME/Documents/LimaBionics/electronics/kicad-libs-suite ]; then
  git clone git@bitbucket.org:robobionics/kicad-libs-suite.git
fi

cd
touch .bash_profile
echo "export LB_ELECTRONICS=$HOME/Documents/LimaBionics/electronics" >> .bash_profile
echo "export LB_PROGRAMMING=$HOME/Documents/LimaBionics/programming" >> .bash_profile
echo "export LB_MECHANICS=$HOME/Documents/LimaBionics/mechanics" >> .bash_profile

touch .bash_aliases
echo "alias cdel='cd ~/Documents/LimaBionics/electronics'" >> .bash_aliases
echo "alias cdpr='cd ~/Documents/LimaBionics/programming'" >> .bash_aliases
echo "alias cdme='cd ~/Documents/LimaBionics/mechanics'" >> .bash_aliases
