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

Plugin 'mrtazz/DoxygenToolkit.vim'
filetype plugin indent on



" ================================================== 
" GLOBAL LEADER KEY
" ================================================== 
:let mapleader = ","
map <leader>d dd


" ================================================== 
" YouCompleteMe configs
" ================================================== 
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '!>'
let g:ycm_warning_symbol = 'o>'
nnoremap <leader>cc :YcmDiag<CR>
" This is a hack to copy the function prototype from the ycm preview window
inoremap <leader>pp <ESC><C-W><C-J>/(<CR>y$<C-W><C-K>p?(<CR>w
" Overwrite next function argument 
" This functions deletes the current argument text (unless its the last argument then it fails miserably)
func DelthisARGUMENT()
  " TODO find the first '<' or ',' and delete the text before it
  execute "normal dwd"

  " Cache the cursor pos and search for template arguments
  " And check if a template argument has been found
  let pp = getpos('.')
  let pos = searchpairpos('<', '', '>')
  " No template just delete until the next ',' appears
  if pos[0] == 0
    execute "normal dt,"
  " Templated parameter >> read out delta of positions and delete text
  else
    let d = (pos[1] - pp[2]) + 1
    call setpos('.', pp)
    execute "normal d" . d . "l"
  endif
endfunction

nnoremap <leader>a :call DelthisARGUMENT()<CR>i


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
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" astyle formatting
func FormatCode(cmd)
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
" open/close errorlist and navigate errors
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
