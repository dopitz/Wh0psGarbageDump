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
  cp ~/.weechat/irc.conf $DIR/.weechat/irc.conf
  cp ~/.weechat/plugins.conf $DIR/.weechat/plugins.conf
  cp ~/.weechat/trigger.conf $DIR/.weechat/trigger.conf
  cp ~/.weechat/weechat.conf $DIR/.weechat/weechat.conf
  echo "copy from home/... to " $DIR
else if [ $1 == "out" ]
then
  cp $DIR/.vimrc ~/.vimrc 
  cp $DIR/.bashrc ~/.bashrc 
  cp $DIR/.latexmkrc ~/.latexmkrc
  cp $DIR/.Xresources ~/.Xresources 
  cp $DIR/.config/redshift.conf ~/.config/redshift.conf 
  cp $DIR/.config/ranger/rc.conf ~/.config/ranger/rc.conf 
  cp $DIR/.config/ranger/rifle.conf ~/.config/ranger/rifle.conf
  cp $DIR/.weechat/irc.conf ~/.weechat/irc.conf
  cp $DIR/.weechat/plugins.conf ~/.weechat/plugins.conf
  cp $DIR/.weechat/trigger.conf ~/.weechat/trigger.conf
  cp $DIR/.weechat/weechat.conf ~/.weechat/weechat.conf
  echo "copy from " $DIR " to home/..."
fi
fi
