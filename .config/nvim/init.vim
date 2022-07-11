" Vim Plugins
call plug#begin()
Plug 'chrisbra/Colorizer'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-plug'
Plug 'shaunsingh/nord.nvim'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
call plug#end()

let mapleader=" "
let g:python3_host_prog = '/usr/bin/python' 

" FZF
map <Leader>m :Files <Esc>

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
colorscheme nord
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
