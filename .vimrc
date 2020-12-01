set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
"Plugin 'airblade/vim-gitgutter.git'
Plugin 'mhinz/vim-signify'
"Plugin 'suan/vim-instant-markdown'
Plugin 'vim-airline/vim-airline'
"Plugin 'szymonmaszke/vimpyter'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'
Plugin 'w0rp/ale'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/goyo.vim'
Plugin 'Kjwon15/vim-transparent'
"Plugin 'wting/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'valloric/YouCompleteMe'
Plugin 'vimwiki/vimwiki', {'pinned': 1}
Plugin 'tbabej/taskwiki'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'powerman/vim-plugin-AnsiEsc'
"Plugin 'psf/black'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tmhedberg/SimpylFold'
"Plugin 'lervag/vimtex'
Plugin 'alfredodeza/pytest.vim'
"Plugin 'matze/vim-tex-fold'
Plugin 'KeitaNakamura/tex-conceal.vim'
Plugin 'danielwe/base16-vim'
"Plugin 'chriskempton/base16-vim'
Plugin 'bling/vim-bufferline'
Plugin 'easymotion/vim-easymotion'
call vundle#end()

let g:ctrlp_working_path_mode = 'ra'

" GOYO
let g:goyo_width = 128

" JEDI
" prevent doc string popups
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_on_dot = 0
let g:jedi#completions = 1

au BufRead,BufNewFile *.md,*.tex set conceallevel=2
let g:tex_conceal="abdgm"
let g:tex_conceal_frac=1

" VIMWIKI
let g:vimwiki_list = [{'path': '~/wiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:taskwiki_markup_syntax = 'markdown'
autocmd FileType vimwiki setlocal spell!
au FileType vimwiki set syntax=markdown.pandoc
au FileType vimwiki set filetype=pandoc

" VIMTEX
let g:vimtex_complete_close_braces = 1

" AIRLINE
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'base16'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'long', 'mixed-indent-file' ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_x = '%-0.15{getcwd()}'
let g:airline_section_c = '%t'

" NERDcomment
let g:NERDDefaultAlign = 'left'

" INSTANT MARKDOWN
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_slow = 0
let g:instant_markdown_mathjax = 1

hi StatusLine ctermbg=0 cterm=NONE
hi Normal ctermbg=0 cterm=NONE
hi CursorLine ctermbg=0 cterm=NONE

" SIMPYLFOLD
let g:SimpylFold_fold_docstring=0
let g:SimpylFold_fold_import=0
let g:SimpylFold_docstring_preview=1
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
"let g:fortran_fold = 1

" YCM
" Latex config from https://samsudar.com/code/vim_and_latex/
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
"let g:ycm_semantic_triggers.pandoc = ['@']
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \]
autocmd BufRead,BufNewFile *.tex let g:ycm_auto_trigger = 0
let g:ycm_filetype_whitelist = { '*': 1}
let g:ycm_filetype_blacklist = { 'fortran': 1, 'pandoc': 1 }
let g:ycm_python_binary_path = '/home/mevans/.local/conda/envs/devtools/bin/python'
"nnoremap <Leader>d :YcmCompleter GetDoc<CR>


" ALE
let g:ale_linters = {}
let g:ale_linters.cpp = ['gcc']
let g:ale_linters.python = ['flake8']
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.pandoc = []
"let g:ale_fixers.python = ['remove_trailing_lines', 'trim_whitespace']
"let g:ale_fixers.pyrex = ['remove_trailing_lines', 'trim_whitespace']
"let g:ale_fixers = { 'yaml': ['remove_trailing_lines', 'trim_whitespace'] }
"let g:ale_fixers = { 'python': ['remove_trailing_lines', 'trim_whitespace', 'black']}
", 'black'] }
"let b:ale_fixers = ['black']
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_echo_msg_error_str = 'E'
"let g:black_linelength = 127
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'
let g:ale_statusline_format = ['✖ %d', '⚠ %d', '']
let g:ale_open_list = 1
"let g:ale_echo_cursor = 0
let g:ale_lint_on_enter = 1
let g:ale_list_window_size = 4
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_delay = 0
let g:ale_lint_on_text_changed = 'always'


" prevent quickfix from being added to buflist
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END


" CTRL-P
let g:ctrlp_cmd = 'CtrlPMixed'


" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "."

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :TagbarOpenAutoClose<CR>

nmap <leader>b !black %<cr>

" fast commenting
map cc <leader>c<space>

" CtrlP keybinds
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>f :CtrlP<CR>
nmap <leader>m :CtrlPMRU<CR>


inoremap jj <Esc>
nnoremap <Leader>l :lnext<CR>
nnoremap <Leader>ll :ll<CR>
nnoremap <Leader>lp :lp<CR>
nnoremap <Leader>gc :Gcommit % <CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>o :noh<CR>
nmap <localleader>ww <Plug>VimwikiIndex
nmap <localleader>www <Plug>VimwikiDiaryMakeNote

" get rid of number incrementing in normal mode
nnoremap . <NOP>
nnoremap <C-a> <NOP>
nnoremap <C-x> <NOP>


" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" numbers
set relativenumber
:au FocusLost   *  :set number
:au FocusGained *  :set relativenumber

" Set 10 lines to the cursor - when moving vertically using j/k
set so=10

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound onronkrrors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-gruvbox-dark-pale

hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=DarkGray ctermbg=yellow


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set backupdir=$HOME/.vim/backup
set undofile
set undodir=$HOME/.vim/undo
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines
set incsearch

au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0 noautoindent
au BufRead,BufNewFile *.md,*.rst set wrap linebreak nolist textwidth=80 wrapmargin=0 noautoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

map <leader><Tab> :bn<cr>
map <localleader><Tab> :tabnext<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
"map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
"map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
"vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
   "<leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
let g:lexical#spelllang = ['en_gb']

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
map <leader>t :NERDTreeToggle<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

set mouse=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" From help:ale_open_list, close loclist when buffer closes
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END
