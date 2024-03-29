#!/bin/zsh
# .zshrc - my zsh startup file

# for zsh profiling
[[ -f $HOME/.profilezsh ]] && zmodload zsh/zprof

if [ ! -f $HOME/.antigen.zsh ]; then
    echo -n "Installing antigen..."
    curl -Ls https://raw.githubusercontent.com/zsh-users/antigen/v2.2.3/bin/antigen.zsh \
        > $HOME/.antigen.zsh
    echo " Done"
fi

ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
ZSH_AUTOCORRECT_BUFFER_MAX_SIZE=30
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_HISTORY_IGNORE='cd *'

ZSH_HIGHLIGHT_HIGHLIGHTERS+=brackets

### WARNING - uncomment this line only when necessary, on a secure,
### single-user system. Who knows what nasty stuff could happen otherwise
# ANTIGEN_COMPINIT_OPTS+="-u"

source $HOME/.antigen.zsh

antigen bundle hlissner/zsh-autopair
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen bundle ael-code/zsh-colored-man-pages
antigen bundle --loc=plugins/dirhistory

antigen theme romkatv/powerlevel10k

antigen apply

# powerlevel10k custom prompt
# To generate a new prompt config, run `p10k configure`.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# case- and hyphen-insensitive completion, and partial words
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}' '+l:|=* r:|=*'
# highlight selection on tab
zstyle ':completion:*' menu select

function prompt_my_shlvl() {
    if (( $SHLVL > 1 )); then
        p10k segment -f red -i '' -t "SHLVL ${SHLVL}"
    fi
}
function prompt_note_to_self() {
    if [ -f .nts ]; then
        p10k segment -f green -i '♩' -t "$(head -n 1 .nts)"
    fi
}
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=note_to_self
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=my_shlvl

# for ^w etc.
WORDCHARS='_'

export HISTSIZE=10000000
export HISTFILESIZE=10000000
export SAVEHIST=10000000
export HISTFILE=~/.zsh_history
export HISTTIMEFORMAT="[%F %T]"
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt NO_SHARE_HISTORY


setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHDMINUS
alias d='dirs -v'


. $HOME/.myrc

# Use fzf bindings if installed
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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


bindkey -e

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
#bindkey -s '^ ' 'vim $(fzf)^M'

help () {
    bash -c "help $*"
}

# push prompt to bottom
# printf '\n%.0s' {1..$(( $(tput lines) - 3 ))}


# for zsh profiling
if [[ -f $HOME/.profilezsh ]]; then
    zprof
fi

