#!/bin/sh
dir=`dirname $0`

isDifferent() {
  diff "$1" "$2" > /dev/null
  return $?
}

copyIfDifferent() {
  isDifferent "$1" "$2"
  if [ $? -eq 1 ]; then
    cp -iv "$1" "$2"
  fi
}

copyIfDifferent "$dir/.gitignore" "$HOME/"
copyIfDifferent "$dir/.gitconfig" "$HOME/"
copyIfDifferent "$dir/.vimrc"     "$HOME/"
