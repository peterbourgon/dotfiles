" minimal example from https://github.com/tpope/vim-pathogen
syntax on
filetype plugin indent on

" vim doesn't play well with fish
set shell=/bin/bash

" preferences
set autoindent
set smartindent
set number
set tabstop=4
set shiftwidth=4
set background=dark
set ruler
set backspace=indent,eol,start
set linebreak
set nojoinspaces

" markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" ctrl-backspace should delete words
imap <C-bs> <C-w>
