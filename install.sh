#!/bin/bash
if [ -e /tmp/mydotfiles ] ; then
    echo $0": Err: /tmp/mydotfiles already exists. Exiting."
    exit 1
fi
set -e
echo "WARNING: This will overwrite existing config in your home directory."
echo "If you want to confirm overwrites interactively, stop now and install"
echo "as oulined in the repo's README instead."
echo "( https://github.com/DarthFloopy/mydotfiles )"
echo "Press enter to continue, or Ctrl-C to quit."
read
git clone --recurse-submodules https://github.com/DarthFloopy/mydotfiles.git /tmp/mydotfiles
cd /tmp/mydotfiles
./synctohomedir.sh --shush
cd - > /dev/null
rm -rf /tmp/mydotfiles
exit 0

