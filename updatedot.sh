#!/bin/bash

# Sav the parent working directory and cd to the directory of the script
DIR=$(pwd)
cd "$( dirname "${BASH_SOURCE[0]}" )"

# Read in the ignore list
IFS=$'\n' read -d '' -r -a lines < dotignore

# Traverse over all subdirectories
for d in $(find . -type d -name "*" -not -path "*.git*"); 
do 
  cont=false
  for ignore in "${lines[@]}"
  do
    if [ "$d" -ef "$ignore" ]; then
      cont=true
    fi
  done

  if test "$cont" = "true"; then
    continue
  fi

  # If the directory does not exist create it
#  if [ ! -d "$HOME/$d" ]; then
#    mkdir "$HOME/$d"
    echo "Createing directory: $HOME/$d"; 
#  fi
done



cd "$DIR"
