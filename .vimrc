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
map <leader>d dd


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
" paraMark mappings
" ================================================== 
nnoremap <C-N> :NextArg<CR>
vnoremap <C-N> <ESC>:NextArg<CR>
nnoremap <C-A> :ThisArg<CR>


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
colorscheme mycandycode
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


" gvim options remove toolbar and scrollbars
set guioptions-=T
set guioptions-=r
set guioptions-=L

set guifont=Droid\ Sans\ Mono\ 10







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



