#!/bin/zsh
# .zshrc - my zsh startup file

# for zsh profiling
[[ -f $HOME/.profilezsh ]] && zmodload zsh/zprof

if [ ! -f $HOME/.antigen.zsh ]; then
    echo -n "Installing antigen..."
    curl -Ls git.io/antigen > $HOME/.antigen.zsh
    echo " Done"
fi

ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
ZSH_AUTOCORRECT_BUFFER_MAX_SIZE=30
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_HISTORY_IGNORE='cd *'

source $HOME/.antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen theme romkatv/powerlevel10k

antigen apply

# powerlevel10k custom prompt
# To generate a new prompt config, run `p10k configure`.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# case- and hyphen-insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'
# highlight selection on tab
zstyle ':completion:*' menu select

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

# command syntax highlighting
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

