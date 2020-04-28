call plug#begin('~/.vim/plugged')

Plug 'dkarter/bullets.vim'

call plug#end ()

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

set mouse=a
set number
set autoindent

imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
