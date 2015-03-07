#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ $1 == "in" ]
then
  cp ~/.vimrc $DIR/.vimrc
  cp ~/.bashrc $DIR/.bashrc
  cp ~/.latexmkrc $DIR/.latexmkrc
  echo "copy from home/ to " $DIR
else if [ $1 == "out" ]
then
  cp $DIR/.vimrc ~/.vimrc 
  cp $DIR/.bashrc ~/.bashrc 
  cp $DIR/.latexmkrc ~/.latexmkrc 
  echo "copy from " $DIR " to home"
fi
fi
