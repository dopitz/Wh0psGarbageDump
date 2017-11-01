#/bin/bash

# awesome
#sudo add-apt-repository  ppa:klaus-vormweg/awesome -y
#sudo apt update
#sudo apt install awesome -y
#sudo apt install awesome-extra -y

# awesome themes and widgets
if [ ! -d "~/.config/awesome/themes/awesomelaawesome" ] 
then
  git clone https://github.com/Wh0p/awesomelaawesome.git ~/.config/awesome/themes/awesomelaawesome
fi
if [ ! -d "~/.config/awesome/banshee" ] 
then
  git clone https://github.com/Wh0p/awesome-banshee.git ~/.config/awesome/banshee
fi
if [ ! -d "~/.config/awesome/lain" ] 
then
  git clone https://github.com/lcpz/lain.git ~/.config/awesome/lain
fi
if [ ! -d "~/.config/awesome/freedesktop" ] 
then
  git clone https://github.com/lcpz/awesome-freedesktop.git ~/.config/awesome/freedesktop
fi

# programs
sudo apt install ranger cmake banshe silversearcher-ag cgdb ffmpeg xtrlock -y

sudo apt install mesa-utils libglew-dev libfreetype6-dev libsqlite3-dev libncurses5-dev libnuma-dev -y
