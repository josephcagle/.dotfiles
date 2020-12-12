
# TODO: add color
PS1='[$(date +%k:%M:%S) \u@\h] \w \$ '

# add bash-specific aliases
. $HOME/.bash_aliases


. $HOME/.myrc
# Run the ssh keychain function if we are in an interactive login shell
[[ $- == *i* ]] && shopt -q login_shell && sshkeychain

# append to the history file; don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# TODO: add this to .zshrc

# Use fzf bindings if installed
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

