" set up Vundle
set nocompatible              " be iMproved, required Vundle
filetype off                  " required Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" your plugins go here ...
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'

" Snippets are separated from ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'ervandew/supertab'
Plugin 'vim-scripts/ZoomWin'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required Vundle
filetype plugin indent on    " required Vundle

" vim-airline options
let g:airline_powerline_fonts = 1 " it's sooo biutiful!
let g:airline_theme='hybrid'
let g:airline#extensions#tabline#enabled = 1

" ultisnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ctrlp options
let g:ctrlp_map = '<c-l>'

" gundo options
nnoremap <F8> :GundoToggle<CR>
set undofile
set undolevels=100
set undodir=/home/kebil/.vim/tmp/undo/



set number
set guioptions=afgimrT
set guifont=Monospace\ 9
set incsearch
set fileformats=unix,dos,mac
set visualbell vb
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set filetype=unix,dos,mac
"set t_AB=[48;5;%dm " we control the background
"set t_AF=[38;5;%dm " we control the foreground
"set t_Co=256 " explicitely say it's a 256 color xterm TIP 1312
set ls=2 " Always show status line
set backup " make backup file
set bdir=/home/kebil/tmp,/tmp " where to put backup file
set directory=/home/kebil/tmp,/tmp " directory is the directory for swap file
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
"set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set mouse=n " use mouse in normal mode (so we can still use *nix c/p in insert mode)
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
"set virtualedit=all " lets the cursor roam everywhere
set showmode " show current mode
set showcmd " show partial command in statusline
set history=1000 " give me a larger past
set ignorecase " make searches case-insensitive, unless they contain upper-case letters:
set hlsearch
set smartcase
set statusline=%f\ %y[%{&encoding}]%([%R%M]%)%=%l/%L,%c%V\ %P
    " Status line detail:
    " %f        file path
    " %y        file type between braces (if defined)
    " %([%R%M]%)    read-only, modified and modifiable flags between braces
    " %{'!'[&ff=='default_file_format']}
    "           shows a '!' if the file format is not the platform
    "           default
    " %{'$'[!&list]}    shows a '*' if in list mode
    " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
    "           only for debug : display the current syntax item name
    " %=        right-align following items
    " #%n       buffer number
    " %l/%L,%c%V    line number, total number of lines, and column number

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,prc

syntax on
filetype indent on
"filetype plugin on
"filetype plugin indent on

"colorscheme peachpuff
"colorscheme desert
"colorscheme torte
"colorscheme darkblue
colorscheme wombat256
"colorscheme xoria256
"
" turn off the background so I can see my transparent background seeping through
hi Normal ctermbg=none
" make sure the folds are not so noticeable
"hi Folded ctermbg=black ctermfg=grey
hi Folded ctermbg=none ctermfg=grey


" the starting char for alt commands
let mapleader = ","
" let loaded_matchparen=1

" I seem to type alot of :W instead of :w
map :W :w

" easy switch buffer
map <C-N> :bn!<CR>
map <C-P> :bp!<CR>

" ,e will open in the current working directory
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"""" perl options
au BufNewFile,BufRead *.t setfiletype perl
au BufNewFile,BufRead *.p? setfiletype perl
au FileType perl set iskeyword+=: " make completion perl friendly
au FileType perl compiler perl " Use perl compiler for all *.pl and *.pm files.
let perl_fold=1 " fold all perl
" http://vim.wikia.com/wiki/Perldoc_function_and_module_keyboard_mappings
au FileType perl noremap K :!echo <cword> <bar> perl -e '$line = <STDIN>; if ($line =~ /(\w+::\w+)/){exec("perldoc $1")} elsif($line =~ /(\w+)/){exec "perldoc -f $1 <bar><bar> perldoc $1"}'<cr><cr>
au FileType perl map <F5> :!perl -MVi::QuickFix <C-R>=expand("%:p")<CR>
au FileType perl map <S-F5> :copen<CR>:cf<CR>
au FileType perl map <F4> :!prove <C-R>=expand("%:p")<CR>
au FileType perl map <S-F4> :!prove -r<CR>

"""" syntax hilighting for cake template files
au BufNewFile,BufRead *.thtml setfiletype php
au BufNewFile,BufRead *.ctp setfiletype php

"""" python options
au BufNewFile,BufRead *.py setfiletype python
"au FileType python compiler python " Use python compiler for all *.pl and *.pm files.
au FileType python set foldmethod=indent
au FileType python nmap <F5> :!python2 <C-R>=expand("%:p")<CR>
au FileType python set makeprg=python2\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
au FileType python set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"au FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


"""" php options
au FileType php map K :call OpenPhpFunction('<c-r><c-w>')<cr>
au FileType php :EnableFastPHPFolds

function! PHPsynCHK()
    let winnum =winnr() " get current window number
    silent make -l %
    cw " open the error window if it contains error
    " return to the window with cursor set on the line of the first error (if any)
    execute winnum . "wincmd w"
endfunction

au FileType php setl makeprg=php
au FileType php set errorformat=%m\ in\ %f\ on\ line\ %l

" Map <CTRL>-B to check the file for syntax
noremap <C-B> :call PHPsynCHK()<CR>


" have some more advanced grepping ( http://vim.sourceforge.net/tip_view.php?tip_id=123 )
" search for a word in files in the same dir as this file
map gr : grep <cword> %:p:h/*<cr>
" search for an independant word in the current dir
map gR : grep \b<cword>\b *<cr>
" search for an independant word in the same dir as this file
map GR : grep \b<cword>\b %:p:h/*<cr>


" Wraps visual selection in an HTML tag
vmap <Leader>t <ESC>:call VisualHTMLTagWrap()<CR>

function! VisualHTMLTagWrap()
    let a:tag = input( "Tag to wrap block: ")
    let a:jumpright = 2 + len( a:tag )
    normal `<
    let a:init_line = line( "." )
    exe "normal i<".a:tag.">"
    normal `>
    let a:end_line = line( "." )
    " Don't jump if we're on a new line
    if( a:init_line == a:end_line )
" Jump right to compensate for the characters we've added
exe "normal ".a:jumpright."l"
    endif
    exe "normal a</".a:tag.">"
endfunction

fun! OpenPhpFunction (keyword)
    let proc_keyword = substitute(a:keyword , '_', '-', 'g')
    exe 'split'
    exe 'enew'
    exe "set buftype=nofile"
    exe 'silent r!links -dump http://www.php.net/manual/en/print/function.'.proc_keyword.'.php'
    exe 'norm gg'
    exe 'call search ("' . a:keyword .'")'
    exe 'norm dgg'
    exe 'call search("User Contributed Notes")'
    exe 'norm dGgg'
endfun
fun! OpenPhpFunctionFF (keyword)
    let proc_keyword = substitute(a:keyword , '_', '-', 'g')
    exe 'firefox --remote "openurl(http://www.php.net/manual/en/print/function.'.proc_keyword.'.php,new-tab)"'
endfun

"function! PerlDoc()
"  normal yy
"  let l:this = @
"  if match(l:this, '^ *\(use\|require\) ') >= 0
"    exe ':new'
"    exe ':resize'
"    let l:this = substitute(l:this, '^ *\(use\|require\) *', "", "")
"    let l:this = substitute(l:this, ";.*", "", "")
"    let l:this = substitute(l:this, " .*", "", "")
"    exe ':0r!perldoc -t ' . l:this
"    exe ':0'
"    return
"  endif
"  normal yiw
"  exe ':new'
"  exe ':resize'
"  exe ':0r!perldoc -t -f ' . @
"  exe ':0'
"endfunction
"
"fun! PerlModuleSource()
"    normal yy
"    let l:this = @
"    let l:this = substitute(l:this, '^ *\(use\|require\) *', "", "")
"    let l:this = substitute(l:this, ";.*", "", "")
"    let l:this = substitute(l:this, " .*", "", "")
"    exe ':new'
"    exe ':resize'
"    exe ':0r!perldoc -m ' . @
"    exe ':0'
"endfun
"
""Display docs for built-in functions when cursor is on function name
""or for modules when cursor is on 'use' or 'require' line.
"au FileType perl map K :call PerlDoc()<CR>:set nomod<CR>:set filetype=man<CR>:echo "perldoc"<CR>
"au FileType perl map <leader>K :call PerlModuleSource()<CR>:set nomod<CR>:set filetype=perl<CR>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://amix.dk/vim/vimrc.html
" Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map auto complete of (, ", ', [
inoremap <Leader>( ()<esc>:let leavechar=")"<cr>i
inoremap <Leader>[ []<esc>:let leavechar="]"<cr>i
inoremap <Leader>{ {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <Leader>} {}<esc>:let leavechar="}"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a

"let g:snippetsEmu_key = "<C-Tab>"

let g:SaveUndoLevels = &undolevels
let g:BufSizeThreshold = 1000000
if has("autocmd")
  " Store preferred undo levels
  au VimEnter * let g:SaveUndoLevels = &undolevels
  " Don't use a swap file for big files
  au BufReadPre * if getfsize(expand("<afile>")) >= g:BufSizeThreshold | setlocal noswapfile | endif
  " Upon entering a buffer, set or restore the number of undo levels
  au BufEnter * if getfsize(expand("<afile>")) < g:BufSizeThreshold | let &undolevels=g:SaveUndoLevels | hi Cursor term=reverse ctermbg=black guibg=black | else | set undolevels=-1 | hi Cursor term=underline ctermbg=red guibg=red | endif
endif

function! HTMLEncode()
perl << EOF
 use HTML::Entities;
 @pos = $curwin->Cursor();
 $line = $curbuf->Get($pos[0]);
 $encvalue = encode_entities($line);
 $curbuf->Set($pos[0],$encvalue)
EOF
endfunction

function! HTMLDecode()
perl << EOF
 use HTML::Entities;
 @pos = $curwin->Cursor();
 $line = $curbuf->Get($pos[0]);
 $encvalue = decode_entities($line);
 $curbuf->Set($pos[0],$encvalue)
EOF
endfunction

"""" PHP option
au FileType php,html map <Leader>h :call HTMLEncode()<CR>
au FileType php,html map <Leader>H :call HTMLDecode()<CR>

"""" get a task list
map <leader>T <Plug>TaskList

