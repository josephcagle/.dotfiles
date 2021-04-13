
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

if has('nvim-0.5')
    source ~/.config/nvim/treesitter_config.vim
endif

