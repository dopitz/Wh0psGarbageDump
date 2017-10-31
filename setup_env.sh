#/bin/bash

# awesome
sudo add-apt-repository  ppa:klaus-vormweg/awesome -y
sudo apt update
sudo apt install awesome -y
sudo apt install awesome-extra -y

# awesome themes and widgets
git clone https://github.com/Wh0p/awesomelaawesome.git ~/.config/awesome/themes/awesomelaawesome
git clone https://github.com/lcpz/lain.git ~/.config/awesome/lain
git clone https://github.com/lcpz/awesome-freedesktop.git ~/.config/awesome/freedesktop

# programs
apt install ranger cmake banshe silversearcher-ag cgdb ffmpeg

apt install mesa-utils libglew-dev libfreetype6-dev libsqlite3-dev libncurses5-dev libnuma-dev
