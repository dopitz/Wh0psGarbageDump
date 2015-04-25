#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ $1 == "in" ]
then
  cp ~/.vimrc $DIR/.vimrc
  cp ~/.bashrc $DIR/.bashrc
  cp ~/.latexmkrc $DIR/.latexmkrc
  cp ~/.Xresources $DIR/.Xresources
  cp ~/.config/redshift.conf $DIR/.config/redshift.conf
  cp ~/.config/ranger/rc.conf $DIR/.config/ranger/rc.conf
  cp ~/.config/ranger/rifle.conf $DIR/.config/ranger/rifle.conf
  echo "copy from home/ to " $DIR
else if [ $1 == "out" ]
then
  cp $DIR/.vimrc ~/.vimrc 
  cp $DIR/.bashrc ~/.bashrc 
  cp $DIR/.latexmkrc ~/.latexmkrc
  cp $DIR/.Xresources ~/.Xresources 
  cp $DIR/.config/redshift.conf ~/.config/redshift.conf 
  cp $DIR/.config/ranger/rc.conf ~/.config/ranger/rc.conf 
  cp $DIR/.config/ranger/rifle.conf ~/.config/ranger/rifle.conf
  echo "copy from " $DIR " to home"
fi
fi
