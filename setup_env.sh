#/bin/bash

# awesome
sudo add-apt-repository  ppa:klaus-vormweg/awesome -y
sudo apt update
sudo apt install awesome -y

# awesome themes and widgets
git clone https://github.com/Wh0p/awesomelaawesome.git ~/.config/awesome/themes/awesomelaawesome
git clone https://github.com/lcpz/lain.git ~/.config/awesome/lain
git clone https://github.com/lcpz/awesome-freedesktop.git ~/.config/awesome/freedesktop

mv -bv awesome-copycats/* ~/.config/awesome
rm -rf awesome-copycats
rm -f ~/.config/awesome/README.rst
rm -f ~/.config/awesome/ISSUE_TEMPLATE.md
cp ~/.config/awesome/mypowerarrowtheme.lua ~/.config/awesome/themes/powerarrow/theme-personal.lua


# programs
apt install ranger cmake banshe silversearcher-ag cgdb ffmpeg

apt install mesa-utils libglew-dev libfreetype6-dev libsqlite3-dev libncurses5-dev libnuma-dev
