syntax on
call plug#begin()

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'reedes/vim-colors-pencil'
Plug 'jacoborus/tender.vim'

call plug#end()

let g:vim_monokai_tasty_italic = 1
set background=dark

let g:vim_markdown_folding_disabled = 1

autocmd VimEnter * set t_ut=
set mouse=a
set number

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set textwidth=0
set wrapmargin=1
set formatoptions+=t
set formatoptions-=l

imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
