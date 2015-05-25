#!/bin/bash

# Sav the parent working directory and cd to the directory of the script
DIR=$(pwd)
cd "$( dirname "${BASH_SOURCE[0]}" )"

# Read in the ignore list
IFS=$'\n' read -d '' -r -a dotignores < dotignore

function isignore()
{
  for ignore in "${dotignores[@]}"
  do
    if [ "$1" -ef "$ignore" ]; then
      return 0
    fi
  done

  return 1
}

# Traverse over all subdirectories
for d in $(find . -type d -name "*" -not -path "*.git*"); 
do 
  # Filter directories in the ignore list
  if isignore $d; 
  then 
    continue  
  fi

  # If the directory does not exist create it
  if [ ! -d "$HOME/$d" ]; then
    mkdir "$HOME/$d"
    echo "Creating directory: $HOME/$d"; 
  fi
done


# Traverse over all files
for f in $(find . -type f -name "*" -not -path "*.git*"); 
do 
  # Filter files in the ignore list
  if isignore $f; 
  then 
    continue  
  fi

  # trim the './' befor each filename
  nf=${f:2:${#f}}

  # If a file already exists delete it
  if [ -f "$HOME/$nf" ]; then
    rm $HOME/$f
    echo "Deleting $HOME/$nf"
  fi

  # Create the symbolic link
  target="`pwd`/$nf"
  ln -s $target $HOME/$f
  echo "Creating $target -> $HOME/$nf";
done


cd "$DIR"
