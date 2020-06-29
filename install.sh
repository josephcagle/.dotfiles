#!/bin/bash
if [ -e mydotfiles ] ; then
    echo $0": Err: mydotfiles already exists. Exiting."
    exit 1
fi
set -e
echo "WARNING: This will overwrite existing config in your home directory."
echo "Press enter to continue."
read
git clone https://github.com/DarthFloopy/mydotfiles.git --recurse-submodules
cd mydotfiles
echo a | ./synctohomedir.sh
cd - > /dev/null
rm -rf mydotfiles
exit 0

