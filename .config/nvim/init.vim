" Vim Plugins
call plug#begin()
Plug 'chrisbra/Colorizer'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-plug'
Plug 'ntk148v/vim-horizon'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'baopham/vim-nerdtree-unfocus'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mzlogin/vim-markdown-toc'
Plug 'ervandew/supertab'
call plug#end()

let mapleader=" "
let g:python3_host_prog = '/usr/bin/python' 

" Spacings
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set list

" Hybrid line numbers
set nu rnu
" Spell check
set spelllang=en
set spell
" Use system clipboard
set clipboard+=unnamedplus

" Colors
set termguicolors
colorscheme horizon
highlight Pmenu ctermbg=gray guibg=gray
set ft=dosini
" Color toggle
nnoremap <C-c> :ColorToggle<CR>

" Abbreviations
abbr #b #!/bin/bash
abbr #f #!/bin/fish
abbr #-= # -=-=-=-=-=-=-=-=-=-=-=

" Move lines up and down
 nnoremap <C-k> :m-2<CR>
 nnoremap <C-j> :m+<CR>
 inoremap <C-k> <Esc>:m-2<CR>
 inoremap <C-j> <Esc>:m+<CR>

" Split screen vertically
set splitright
noremap <C-b> :vsplit<CR>

 " Tab previous and tab next
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Commenting
set formatoptions-=cro-
filetype plugin on
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
nnoremap <C-_> :call NERDComment(0,"toggle") <CR>

" Restore cursor to line on exit
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
augroup END
