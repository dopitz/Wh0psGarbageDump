#/bin/bash

apt install python-pip
pip install neovim

add-apt-repository ppa:neovim-ppa/unstable
apt update
apt install neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
