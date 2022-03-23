source ~/.vimrc_minimal

" Only load vim plugins if plug is installed
" Manually source this file to install plug
if filereadable('~/.vim/autoload/plug.vim')
  source ~/.vimrc_plugins
endif
