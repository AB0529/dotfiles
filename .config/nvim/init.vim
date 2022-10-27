set encoding=utf-8
set noswapfile
set scrolloff=7
set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set spell
set clipboard+=unnamedplus
set splitright
set list
set listchars=tab:>-
set mouse=a
set rnu

let mapleader = ' '

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'neovim/neovim-lspconfig'

call plug#end()

colorscheme gruvbox
set bg=dark
let g:airline_theme='gruvbox'

map <Leader>m :Files <Esc>

" NERDCommenter
set formatoptions-=cro-
filetype plugin on
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
nnoremap <C-_> :call NERDComment(0,"toggle") <CR>

" NERDTree
let NERDTreeQuitOnOpen=1
nmap <F2> :NERDTreeToggle<CR>

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-q> :bq<CR>

" Spell
hi clear SpellBad
hi SpellBad cterm=underline

" Sneak
map f <Plug>Sneak_s
map F <Plug>Seank_S

" Move lines up and down
nnoremap <C-k> :m-2<CR>
nnoremap <C-j> :m+<CR>
inoremap <C-k><Esc> :m-2<CR>
inoremap <C-j><Esc> :m+<CR>

" Exit terminal mode
:tnoremap <Esc> <C-\><C-n>
