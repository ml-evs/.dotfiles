lua << EOF

vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

-- Add your packages

paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/completion-nvim'
paq 'nvim-lua/lsp_extensions.nvim'

paq 'hrsh7th/nvim-compe'
paq 'nvim-treesitter/nvim-treesitter'
paq 'nvim-treesitter/playground'

paq 'danielwe/base16-vim'
paq 'bling/vim-bufferline'
paq 'mhinz/vim-startify'
paq 'vim-airline/vim-airline'
paq 'vim-airline/vim-airline-themes'
paq 'Kjwon15/vim-transparent'
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'
paq 'scrooloose/nerdcommenter'

require'lspconfig'.pyright.setup{}
local custom_lsp_attach = function(client)
  -- See `:help nvim_buf_set_keymap()` for more information
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
  -- ... and other keymappings for LSP

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- For plugins with an `on_attach` callback, call them here. For example:
  require('completion').on_attach()
end


EOF

let mapleader = ","
let g:maperleader = ","
let maplocalleader = "."

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

nmap <leader>w :w!<cr>
map cc <leader>c<space>

inoremap jj <Esc>
nnoremap <leader>l :lnext<cr>
nnoremap <leader>ll :ll<cr>

set relativenumber
:au FocusLost * :set number
:au FocusGained * :set relativenumber

set so=10

set wildmenu
set wildignore=*.o,*~,*.pyc

set ruler
set cmdheight=1

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-gruvbox-dark-pale

set guicursor=

set encoding=utf8
set ffs=unix,dos,mac

set backup
set backupdir=$HOME/.nvim/backup
set undofile
set undodir=$HOME/.nvim/undo
set nowb
set noswapfile

set expandtab
set smarttab

set shiftwidth=4
set tabstop=2

map j gj
map k gk

map <leader><Tab> :bn<cr>
map <localleader><Tab> :tabnext<cr>

set laststatus=2

map <leader>ss :setlocal spell!<cr>
let g:lexical#spelllang = ['en_gb']

map <leader>pp :setlocal paste!<cr>

" AIRLINE
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'long', 'mixed-indent-file' ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_x = '%-0.15{getcwd()}'
let g:airline_section_c = '%t'

