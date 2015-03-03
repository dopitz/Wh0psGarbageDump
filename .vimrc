" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Daniel Opitz 
"
"
"
" Keymaps by this file:
"
" <F4>            Switch headder/source file (FileSwitch)
"
" n<C-A>          paraMark:NextArg jumps to the next function parameter and marks it in visual mode
" i<C-A>          paraMark:NextArg jumps to the next function parameter and marks it in visual mode
" v<C-A>          paraMark:NextArg jumps to the next function parameter and marks it in visual mode
" i<C-D>1-0       Copy the function header from the preview window
" n<C-H/L/J/K>    Navigate to left/right/up/down split window
" n<C-X/Z>        Navigate to next/previous tab window
" n<C-S           Save file
" n<C-Up/Down>    Open close errorlist after compile
" n<C-Left/Right> Navigate to next/previsous error
"
" n<leader>df     Format code of current buffer via astyle
" n<leader>o      Launch CtrlP
" n<leader>t      Launch NERDTree

 







" ================================================== 
" ABLE VI COMPATIBILITY 
" ================================================== 
set nocompatible



" ================================================== 
" PLUGINS
" ================================================== 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'Wh0p/FSwitch'

Plugin 'Wh0p/paraMark'

Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'

Plugin 'kien/ctrlp.vim'

Plugin 'msanders/snipmate.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'mrtazz/DoxygenToolkit.vim'

Plugin 'bling/vim-airline'
filetype plugin indent on



" ================================================== 
" GLOBAL LEADER KEY
" ================================================== 
:let mapleader = ","


" ================================================== 
" Airline config
" ================================================== 
set laststatus=2
let g:airline#extensions#tabline#enabled = 1



" ================================================== 
" YouCompleteMe configs
" ================================================== 
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '!>'
let g:ycm_warning_symbol = 'o>'
nnoremap <leader>cc :YcmDiag<CR>

" This is a hack to copy the function prototype from the ycm preview window
func! CopyParamList(line)
  " switch to the preview window goto the end of line 'line' and search the first ')' backwards
  silent! wincmd P
  execute "normal! " . a:line . "G0"
  call search('(', '', line('.'))
  " save the end pos of the parameter list
  let beg = getpos('.')
  " search for the matching opening bracket
  let res = searchpair('(', '', ')')
  if res > 0
    " if found copy the parameter list using visual mode
    let end = getpos('.')
    call setpos("'<", beg)
    call setpos("'>", end)
    normal! gvy
    " return to the initial pos in the original file and paste the copied parameter list
    silent! wincmd p
    normal! p$h
  else
    echo "Error when parsin function parameter list"
  endif
endfunction
" Copy the parameter list for up to 10 diferent overloads
inoremap <C-D>d <ESC>:call CopyParamList(1)<CR>
inoremap <C-D>1 <ESC>:call CopyParamList(1)<CR>
inoremap <C-D>2 <ESC>:call CopyParamList(2)<CR>
inoremap <C-D>3 <ESC>:call CopyParamList(3)<CR>
inoremap <C-D>4 <ESC>:call CopyParamList(4)<CR>
inoremap <C-D>5 <ESC>:call CopyParamList(5)<CR>
inoremap <C-D>6 <ESC>:call CopyParamList(6)<CR>
inoremap <C-D>7 <ESC>:call CopyParamList(7)<CR>
inoremap <C-D>8 <ESC>:call CopyParamList(8)<CR>
inoremap <C-D>9 <ESC>:call CopyParamList(9)<CR>
inoremap <C-D>0 <ESC>:call CopyParamList(0)<CR>



" ================================================== 
" paraMark mappings
" ================================================== 
nnoremap <C-A> :NextArg<CR>
inoremap <C-A> <ESC>:NextArg<CR>
vnoremap <C-A> <ESC>:NextArg<CR>


" ================================================== 
" NERDTree shortcuts
" ================================================== 
nnoremap <leader>t :NERDTree<CR>


" ================================================== 
" CtrlP shortcuts and ingnore
" ================================================== 
nnoremap <leader>o :CtrlP<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|build$\|doc$',
  \ 'file': '\.out$\|\.dat$'
  \ }
let g:ctrlp_working_path_mode = ''




" ================================================== 
" TEXT ENCODING AND FORMATTING
" ================================================== 
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" use indentation of previous line and indentation for C
set autoindent
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=2
set shiftwidth=2
set expandtab 
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn on syntaxhighlight with colorscheme candycode
set t_Co=256
syntax on
colorscheme candycode
" turn relative line numbers on
set number
set relativenumber
" highlight matching braces and cursor line
set cursorline
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" gvim options remove toolbar and scrollbars
set guioptions-=T
set guioptions-=r
set guioptions-=L
" gvim font
set guifont=Droid\ Sans\ Mono\ 10


" astyle formatting
func! FormatCode(cmd)
  let pos = getpos(".")
  exec "%!" . a:cmd
  call setpos(".", pos)
endfunction

if executable("astyle")
  let astyle = "astyle --style=allman --indent=spaces=2 --indent-switches --indent-namespaces --indent-preproc-define --indent-col1-comments --min-conditional-indent=0 --pad-oper --pad-header --unpad-paren --align-pointer=type --align-reference=type" 
  
  nnoremap <leader>df :call FormatCode(astyle)<CR>
endif







" ================================================== 
" CURSOR MOVEMENT
" ================================================== 
" center screen with space, on search next/previous, GOTO line
nnoremap <space> zz
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz
set scrolloff=25



" ================================================== 
" WINDOW SPLITS AND TABS
" ================================================== 
" open new split planes to right and bottom
set splitbelow
set splitright
" remap split window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
" tab cycle
nnoremap <C-X> :tabn<CR>
nnoremap <C-Z> :tabp<CR>
" switch between header/source with F4
map <F4> :FSHere<CR>




" ================================================== 
" LOAD SAVE KEYMAPS FILES
" ==================================================  
nnoremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR>i
nnoremap <leader>q :q<CR>


" ================================================== 
" BUILD AND DEBUG KEYMAPS
" ==================================================  
" make project 
map <F7> :make -C ./build/<CR>
" make clean
map <S-F7> :make clean all -C ./build/<CR>
" open/close errorlist and navigate errors
nnoremap <C-Up> :cw<CR>
nnoremap <C-Down> :ccl<CR>
nnoremap <C-Left> :cp<CR>
nnoremap <C-Right> :cn<CR>



