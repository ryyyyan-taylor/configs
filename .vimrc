call plug#begin('~/.vim/plugged')

Plug 'dkarter/bullets.vim'
Plug 'tpope/vim-markdown'
Plug 'airblade/vim-gitgutter'

call plug#end ()

set encoding=UTF-8
syntax on
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

set mouse=a
set number
set autoindent
set wildmenu

"Allow movement through split lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
