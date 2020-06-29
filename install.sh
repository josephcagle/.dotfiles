#!/bin/bash
if [ -e /tmp/mydotfiles ] ; then
    echo $0": Err: /tmp/mydotfiles already exists. Exiting."
    exit 1
fi
set -e
echo "WARNING: This will overwrite existing config in your home directory."
echo "Press enter to continue."
read
git clone --recurse-submodules https://github.com/DarthFloopy/mydotfiles.git /tmp/mydotfiles
cd /tmp/mydotfiles
echo a | ./synctohomedir.sh
cd - > /dev/null
rm -rf /tmp/mydotfiles
exit 0

