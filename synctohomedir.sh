#!/bin/bash

if [ "$1" = "--shush" ]; then
    SHUSH=1
fi

if [ ! -f dotfiles.list ]; then
    echo 'No dotfiles.list -- are you in the right directory?' >&2
    exit 1
fi

if [ x$SHUSH != x1 ]; then
    echo 'Be sure to `git pull --recurse-submodules` the latest version if your version is behind.'
fi

# TODO: figure out why this doesn't happen when this is run with ./install.sh
# TODO: figure out why this does happen... *sigh*
# TODO: do more testing ig
echo "Copying files..."

overwrite_all=0

if [ x$SHUSH = x1 ]; then
    overwrite_all=1
fi

for dotfile in $(cat dotfiles.list | grep -v '^#') ; do
#   There should be no .gitignore'd files in dotfiles.list
#    if git check-ignore $dotfile ; then
#        continue
#    fi

    if [ -e $HOME/$dotfile -a $overwrite_all = 0 ]; then
        echo -n 'Overwrite $HOME/'$dotfile'? ([y]es/[n]o/[a]ll) '
        read -rn 1 response ; echo
        case $response in
        *a*)
            overwrite_all=1
        ;;
        *y*)
            ;;
        *)
            continue
        ;;
        esac
    fi
    rm -rf $HOME/$dotfile
    cp -rv $dotfile $HOME/$dotfile
done

echo "All done!"

# (Old script)

#for dotfile in .*
#do
#    [ $dotfile != . ] &&                                                        \
#    [ $dotfile != .. ] &&                                                       \
#    [ $dotfile != .DS_Store ] &&                                                \
#    [ $dotfile != .git ] &&                                                     \
#    [ $dotfile != .gitignore ] &&                                               \
#    [ $dotfile != .mailmap ] &&                                                 \
#    [ ! "$(echo $dotfile | grep -qE '.swp$' ; echo $?)" = 0 ] &&                \
##    for otherfile in $(cat .gitignore); do [ $dotfile != $otherfile ]; done &&  \
#    cp -riv $dotfile $HOME
#done

#echo "Making script for updating dotfiles in $HOME ..."
#cat <<END > $HOME/.updatedotfiles.sh && \
#  chmod u+x $HOME/.updatedotfiles.sh && \
#   echo "Created .updatedotfiles.sh"
##!/bin/bash
#echo "cd'ing to $HOME/Programming/mydotfiles."
#(cd $HOME/Programming/mydotfiles && exec ./synctohomedir.sh)
#END


