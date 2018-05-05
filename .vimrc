execute pathogen#infect()
Helptags
"let g:airline_theme='base16_isotope'
"let g:airline_theme='base16_tomorrow'
let g:airline_theme='wal'
let g:airline_powerline_fonts='1'
let g:airline#extensions#tabline#enabled = 1

let base16colorspace=256

set laststatus=2

syntax on
filetype plugin indent on

" minimal vimrc for my sanity

" line numbers
set number
set background=dark
" scroll with mouse
" highlight all on glob match
set hlsearch

"set tw=79

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
set softtabstop=0
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" upon pressing tab, insert 4 spaces
set expandtab

" Enable scrolling
set mouse=a

call plug#begin()

Plug 'dylanaraps/wal.vim'

call plug#end()

colorscheme wal

au BufNewfile,BufRead *.page set filetype=markdown

" Mutt Config
autocmd BufNewFile,BufRead /tmp/mutt* set noautoindent filetype=mail wm=0 tw=80 nonumber digraph nolist
autocmd BufNewFile,BufRead ~/tmp/mutt* set noautoindent filetype=mail wm=0 tw=80 nonumber digraph nolist
