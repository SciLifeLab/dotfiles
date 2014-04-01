" Handy vim commands
" to open a file into a new buffer:
"   :e file.py
" to see a list of current buffers:
"   :ls
" to switch to e.g. buffer 1
"   :b1
" to open a new tab for each open buffer:
"   :tab sball
" to switch tabs:
"   gt or gT
" to split window vertically
"   Ctrl-w v
" to resize vertical window
"   # Ctrl-w > or # Ctrl-w < where number is optional
" to split window horizontally
"   Ctrl-w s
" to change two vertically split windows to horizontal
"   Ctrl-W K
" to change to horizontally split windows to vertical
"   Ctrl-W H
"   NOTE that actually all the HJKL keys move the current window in that
"   direction
" to move a split window into a tab
"   Ctrl-w T
" to open buffer 1 in a new horizontal window
"   :sbuffer b1
" to open buffer 1 in a new vertical window
"   :vert sb b1
" to close a buffer (not all buffers)
"   :bd
" to switch between windows
"   Ctrl-w w (h, j, k, l)
" to close window
"   Ctrl-w c
" to close all windows except current
"   Ctrl-w o
" switch to existing tab if buffer open, create new one if not (doesn't seem to work)
" se switchbuf=usetab,newtab

"if match($TERM, "screen")!=-1
"    set term=xterm-256color
"endif
"
if match($TERM, "screen-256color")!=-1
    set term=xterm-256color
endif


" Mario key mappings
:map @@ :let @/ = ''<CR>

set nocompatible
filetype off            " required
set hidden              " hide buffers instead of closing them when switching

set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'gmarik/vundle'


" Bundles
" =======
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
"Bundle 'kien/ctrlp.vim'
"Bundle 'altercation/vim-colors-solarized'
filetype plugin indent on   " automatically detect filetypes (required
"
" Tagbar
nnoremap <silent> <leader>tt :TagbarToggle<CR>
"nmap <leader>tt :TagbarToggle<CR>
let g:tagbar_autofocus = 1                            " switch to tagbar when opened
let g:tagbar_foldlevel = 99
"
" NERDTree
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Mouse, history
" ==============

scriptencoding utf-8
set history=1000
"set backup
"set backupdir=$HOME/.vim/backups
if has('persistent undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
endif


" VimUI
" =====

syntax enable

" jellybeans
colorscheme jellybeans
set background=dark


"" Paint a red line down the screen at 80 chars
"if exists('+colorcolumn')
"      highlight ColorColumn ctermbg=1
"      set colorcolumn=80
"else
"      au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

" Color screen slightly differently at 80 chars
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")


"" Color text past 80 chars
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

"highlight clear SignColumn      " SignColumn should match background for
                                " things like vim-gitgutter

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

    let g:airline_theme='powerlineish'       " airline users use the powerline theme
    let g:airline_powerline_fonts=1          " and the powerline fonts
endif

set noscrollbind                " Windows scroll independently (:set scrollbind to scroll together)
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
"set list! or set nolist to turn off highlighting whitespace
set list                        " Highlight problematic whitespace
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set list listchars=tab:\ \ ,trail:·

" Formatting
" ==========
set wrap                      " Wrap long lines
set autoindent                  " Indent at the same level of the previous line
set matchpairs+=<:>            " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
" Python
"autocmd FileType python set shiftwidth=4 | set expandtab | set tabstop=4 | set softtabstop=4
set shiftwidth=4                " Use indents of 4 spaces
set smarttab                    " Mostly redundant
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent


" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Key Mapping
" ===========
let mapleader = '\'             " Why isn't this working?
let g:mapleader = '\'

" For when you forget sudo
cmap w!! w !sudo tee % >/dev/null
" Show changes since last write
cmap w% w !diff % -


" Linux/Mac/Win compatibility
if has ('x') && has ('gui') " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
endif
