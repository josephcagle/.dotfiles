# mydotfiles
My custom dotfiles for Linux and Mac
---

This repo contains my dotfiles and config files for Bash, ZSH and Vim, for Unix-ish systems.

## Download / Installation

Run `git clone --recurse-submodules https://github.com/DarthFloopy/mydotfiles.git` to get all the files.
Then, `cd` into the repo folder (`mydotfiles`) and run `./synctohomedir.sh [--shush]` to copy files into your home directory. (The `--shush` option omits prompts and friendly make-sure-you-pulled-the-latest-version reminders.) To pull updates, run `git pull --recurse-submodules`.

When you're done, log out and back in or `source` the `.bashrc` (assuming you're using bash) to use the new config.
To use Vim plugins, follow the Vundle download prompt and plugin install instructions next time you start Vim.
(I.e., hit enter to download Vundle and then run `:PluginInstall`.)

What is all this `--recurse-submodules` funny business, you ask? It's to download any git repos that are embedded in this repo (e.g., ZSH plugins I got from GitHub).

## Notes
 - This repo includes my selected plugins and config for Vim. Please note that it isn't meant to work with any version earlier than Vim 8. (In other words, it's sorta kinda broken if you use Vim 7.)
 - These files include startup code for an OhMyZsh installation not included in this repo.

