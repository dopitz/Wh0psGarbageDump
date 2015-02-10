" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Daniel Opitz 
"
 
" ================================================== 
" DISABLE VI COMPATIBILITY 
" ================================================== 
set nocompatible



" ================================================== 
" PLUGINS
" ================================================== 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'

Plugin 'kien/ctrlp.vim'

Plugin 'msanders/snipmate.vim'

Plugin 'Valloric/YouCompleteMe'
filetype plugin indent on



" ================================================== 
" GLOBAL LEADER KEY
" ================================================== 
:let mapleader = ","
map <leader>d dd

" ================================================== 
" NERDTree shortcuts
" ================================================== 
nnoremap <leader>t :NERDTree<CR>

" ================================================== 
" CtrlP shortcuts
" ================================================== 

nnoremap <leader>o :CtrlP<CR>



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
" turn on syntaxhighlight with colorscheme wombat256
set t_Co=256
syntax on
colorscheme candy.vim
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */




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





" ================================================== 
" LOAD SAVE KEYMAPS FILES
" ==================================================  
nmap <C-S> :w<CR>
imap <C-S> <ESC>:w<CR>i
nnoremap <leader>e :e 
nnoremap <leader>q :q<CR>


" ================================================== 
" LOAD SAVE KEYMAPS 
" ==================================================  
" make project 
map <F7> :make -C ./build/<CR>
" make clean
map <S-F7> :make clean all -C ./build/<CR>
" opwn/close errorlist and navigate errors
nnoremap <C-Up> :cw<CR>
nnoremap <C-Down> :ccl<CR>
nnoremap <C-Left> :cp<CR>
nnoremap <C-Right> :cn<CR>



" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif
