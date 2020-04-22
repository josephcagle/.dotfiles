#!/bin/bash

echo 'Be sure to `git` the latest version if yours is behind.' 
echo "Copying files..."

for dotfile in .*
do
    [ $dotfile != . ] &&                                                        \
    [ $dotfile != .. ] &&                                                       \
    [ $dotfile != .DS_Store ] &&                                                \
    [ $dotfile != .git ] &&                                                     \
    [ $dotfile != .gitignore ] &&                                               \
    [ $dotfile != .mailmap ] &&                                                 \
    [ ! "$(echo $dotfile | grep -qE '.swp$' ; echo $?)" = 0 ] &&                \
#    for otherfile in $(cat .gitignore); do [ $dotfile != $otherfile ]; done &&  \
    cp -riv $dotfile $HOME
done

#echo "Making script for updating dotfiles in $HOME ..."
#cat <<END > $HOME/.updatedotfiles.sh && \
#  chmod u+x $HOME/.updatedotfiles.sh && \
#   echo "Created .updatedotfiles.sh"
##!/bin/bash
#echo "cd'ing to $HOME/Programming/mydotfiles."
#(cd $HOME/Programming/mydotfiles && exec ./synctohomedir.sh)
#END

echo "All done!"

