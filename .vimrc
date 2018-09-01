call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim/'
Plug 'josephvoss/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rodjek/puppet'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'tag': 'v1.17' }
Plug 'junegunn/goyo.vim'

call plug#end()

execute pathogen#infect()

"let g:airline_theme='base16_isotope'
"let g:airline_theme='base16_tomorrow'
let g:airline_theme='wal'
let g:airline_powerline_fonts='1'
let g:airline#extensions#tabline#enabled = 1

" Signify
let g:signify_vcs_list = ["git"]

" Syntastic garbage
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_puppet_checkers = ['puppet']
let g:syntastic_go_checkers = ['go']

let g:go_version_warning = 0

let base16colorspace=256

" line numbers
set relativenumber
set number

set fillchars+=vert:\│
hi VertSplit ctermfg=Black ctermbg=DarkGray

set laststatus=2

set background=dark
syntax on
filetype plugin indent on

" cursor centered lined
set so=999
set cursorline

" highlight all on glob match
set hlsearch

" Don't complain about switching buffers
set hidden

" jk == esc 
:inoremap jk <Esc>
:vnoremap jk <Esc>
:nnoremap jk <Esc>
set timeoutlen=250 ttimeoutlen=0

" Wildmenu settings
set wildmode=list:longest,full
set wildmenu

" show existing tab with 4 spaces width
set tabstop=2
set softtabstop=0
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" upon pressing tab, insert 4 spaces
set expandtab

" Enable scrolling
set mouse=a

au BufNewfile,BufRead *.page set filetype=markdown

" Mutt Config
autocmd BufNewFile,BufRead /tmp/mutt* set noautoindent filetype=mail wm=0 tw=80 nonumber digraph nolist
autocmd BufNewFile,BufRead ~/tmp/mutt* set noautoindent filetype=mail wm=0 tw=80 nonumber digraph nolist

" Folding
set fdm=syntax
set nofoldenable
