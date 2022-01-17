#!/bin/zsh
# .zshrc - my zsh startup file

# for zsh profiling
[[ -f $HOME/.profilezsh ]] && zmodload zsh/zprof

if [ ! -f $HOME/.mydotfiles_misc/antigen.zsh ]; then
    echo -n "Installing antigen..."
    curl -Ls git.io/antigen > $HOME/.mydotfiles_misc/antigen.zsh
    echo " Done"
fi

source $HOME/.mydotfiles_misc/antigen.zsh

antigen apply

# Don't share history between concurrent sessions
setopt APPEND_HISTORY
setopt NO_SHARE_HISTORY

. $HOME/.myrc

# allow sourcing files in current directory
alias .='source'

# Run the ssh keychain function if we are in an interactive login shell
# and if there is no ~/.nokeychain file
[[ $- == *i* ]] && [[ -o login ]] && \
    [[ ! -f $HOME/.nokeychain ]] && sshkeychain

# Use "pure" theme, customizing colors
fpath+=$HOME/.mydotfiles_misc/pure
autoload -U promptinit; promptinit
prompt pure
# zstyle :prompt:pure:user color green
# zstyle :prompt:pure:host color cyan

# command syntax highlighting
source "$HOME/.mydotfiles_misc/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[comment]='fg=grey,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=none'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'

# Mac iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
#bindkey -s '^ ' 'vim $(fzf)^M'

help () {
    bash -c "help $*"
}

# Use fzf bindings if installed
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# for zsh profiling
if [[ -f $HOME/.profilezsh ]]; then
    zprof
fi

