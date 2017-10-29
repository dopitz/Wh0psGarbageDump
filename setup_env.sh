#/bin/bash

sudo add-apt-repository  ppa:klaus-vormweg/awesome -y
sudo apt update
sudo apt install awesome -y

cd ~/.config/awesome
git clone https://github.com/streetturtle/awesome-wm-widgets.git

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
sudo apt-get update
sudo apt-get install arc-theme

apt install ranger
dconf write "/org/gnome/desktop/input-sources/xkb-options" "['caps:swapescape']"

apt install mesa-utils libglew-dev libfreetype6-dev libsqlite3-dev libncurses5-dev libnuma-dev cmake
