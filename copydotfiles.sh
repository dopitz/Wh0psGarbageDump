#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ $1 == "in" ]
then
  cp ~/.vimrc $DIR/.vimrc
  echo "copy from home/ to " $DIR
else if [ $1 == "out" ]
then
  cp $DIR/.vimrc ~/.vimrc 
  echo "copy from " $DIR " to home"
fi
fi
