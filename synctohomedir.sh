#!/bin/bash

echo "Copying files..."

for dotfile in .*
do
    [ $dotfile != .git ] &&      \
    [ $dotfile != .mailmap ] &&  \
    cp -v $dotfile $HOME
done

echo "Done!"

