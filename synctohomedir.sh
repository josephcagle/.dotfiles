#!/bin/bash

echo "Copying files..."

for dotfile in .*
do
    [ $dotfile != .git ] &&      \
    [ $dotfile != .mailmap ] &&  \
    cp -v $dotfile $HOME
done

echo "Making script for updating dotfiles in $HOME ..."
cat <<END > $HOME/.updatedotfiles.sh
#!/bin/bash
echo "cd'ing to $HOME/Programming/mydotfiles."
(cd $HOME/Programming/mydotfiles && exec ./synctohomedir.sh)
END
echo "Created .updatedotfiles.sh"

echo "All done!"

