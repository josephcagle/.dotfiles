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
    mkdir -p $(dirname $HOME/$dotfile)
    cp -rv $dotfile $HOME/$dotfile
done

echo "All done!"

