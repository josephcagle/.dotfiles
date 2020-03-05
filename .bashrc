
PS1='[$(date +%k:%m:%S) \u@\h] \w $ '

# remove this when path setting is added to .myrc
PATH=$PATH:$HOME/bin

# add bash-specific aliases
. .bash_aliases


. .myrc

# append to the history file; don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# TODO: add this to .zshrc


