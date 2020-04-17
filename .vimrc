
if has("gui_running")
	syntax on
	set hlsearch
	colorscheme macvim
	set bs=2
	set ai
	set ruler
	set lsp=2

	nnoremap <MiddleMouse> <Nop>
	nnoremap <2-MiddleMouse> <Nop>
	nnoremap <3-MiddleMouse> <Nop>
	nnoremap <4-MiddleMouse> <Nop>

	inoremap <MiddleMouse> <Nop>
	inoremap <2-MiddleMouse> <Nop>
	inoremap <3-MiddleMouse> <Nop>
	inoremap <4-MiddleMouse> <Nop>

	autocmd BufRead,BufNewFile *.md set filetype=markdown
	autocmd BufRead,BufNewFile linuxclassnotes.md colorscheme slate
	autocmd BufRead,BufNewFile linuxclassnotes.md setlocal lbr
	autocmd BufRead,BufNewFile linuxclassnotes.md setlocal guifont=UbuntuMono-Regular:h20
	autocmd BufRead,BufNewFile linuxclassnotes.md setlocal columns=185
endif

set number

" inoremap ii <Esc>
inoremap jk <Esc>
inoremap ja <Esc>ja
inoremap jA <Esc>jA

