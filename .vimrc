call plug#begin('~/.vim/plugged')

Plug 'dkarter/bullets.vim'
Plug 'tpope/vim-markdown'
Plug 'airblade/vim-gitgutter'

call plug#end ()

:colorscheme industry

set encoding=UTF-8
syntax on
filetype plugin indent on
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set mouse=a
set number
set autoindent
set wildmenu
highlight LineNr ctermfg=grey
set spelllang=en_us

"Allow movement through split lines"
set wrap linebreak nolist
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
