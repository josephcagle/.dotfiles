#!/bin/bash

echo 'Be sure to `git pull --recurse-submodules` the latest version if your version is behind.'
echo "Copying files..."

overwrite_all=0
for dotfile in $(cat dotfiles.list | grep -v '^#') ; do
    if git check-ignore $dotfile ; then
        continue
    fi

    if [ -e ~/$dotfile -a $overwrite_all = 0 ]; then
        echo -n 'Overwrite ~/'$dotfile'? (y/n/a) '
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

echo "All done!"

