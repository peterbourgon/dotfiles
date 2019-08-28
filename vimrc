" Defaults, mostly from govim's suggested minimal config.
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set number
set background=dark

filetype plugin on

set mouse=a
set ttymouse=sgr

set updatetime=500
set balloondelay=250
set signcolumn=number

syntax on

set autoindent
set smartindent
filetype indent on

set backspace=2


" Vim8 packages get loaded after the user's .vimrc.
" Workaround is to force-load Vim8 packages early.
packadd govim

" Move hover popups below and to the right.
call govim#config#Set("ExperimentalMouseTriggeredHoverPopupOptions", {
      \ "mousemoved": "any",
      \ "pos": "topleft",
      \ "line": +1,
      \ "col": 0,
      \ "moved": "any",
      \ "wrap": v:false,
      \ "close": "click",
      \ "padding": [0, 1, 0, 1],
      \})

" Change the hover popup colors.
highlight Pmenu ctermbg=gray guibg=gray


" Use buffers like tabs.
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-W> :bd<CR>
