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
set clipboard=unnamedplus
set splitright
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set mouse=a
set nu rnu

let mapleader = ' '

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'justinmk/vim-sneak'
Plug 'chrisbra/Colorizer'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

colorscheme gruvbox
set bg=dark
let g:airline_theme='gruvbox'

lua require("init")

" NERDCommenter
set formatoptions-=cro-
filetype plugin on
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle<CR>gv

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-q> :bd<CR>

" Spell
hi clear SpellBad
hi SpellBad cterm=underline

" Sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Move lines up and down
nnoremap <C-k> :m-2<CR>
nnoremap <C-j> :m+<CR>
inoremap <C-k><Esc> :m-2<CR>
inoremap <C-j><Esc> :m+<CR>

" Trouble
nnoremap <leader>t :TroubleToggle<CR>

" Exit terminal mode
:tnoremap <Esc> <C-\><C-n>

