# mydotfiles
My custom Linux/Mac dotfiles

## Download / Installation
Run `git clone --recurse-submodules https://github.com/DarthFloopy/mydotfiles.git` to get all the files.
Then, run `./synctohomedir.sh [--shush]` to copy files into your home directory. (The `--shush` option omits prompts and friendly make-sure-you-pulled-the-latest-version reminders.)

To pull updates, run `git pull --recurse-submodules`.

What is all this `--recurse-submodules` funny business, you ask? It's to download any git repos that are embedded in this repo (e.g., vim plugins I got from GitHub).

Notes:
 - This repo includes my selected plugins and config for Vim. Please note that it isn't meant to work with any version earlier than Vim 8. (In other words, it's sorta kinda broken if you use Vim 7.)
 - These files include startup code for an OhMyZsh installation not included in this repo.

