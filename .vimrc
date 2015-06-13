" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Daniel Opitz 
"
"
"
" Keymaps by this file:
"
" Open/Close/Navigate Windows/Tabs
" =========================================================
" n<leader>p              Launch CtrlP
" n<leader>o              Launch CtrlP in new tab
"
" n<C-S>                  Save file
" i<C-S><C-S>             Save file
" ni<C-S><C-A>            Save all
" n<C-E><C-E>             Quit file
" n<C-E><C-A>             Save session and exit all
"
"
" n<C-J>                  Move cursor to split window above
" n<C-K>                  Move cursor to split window below
" n<C-H>                  Move cursor to split window to the left
" n<C-L>                  Move cursor to split window to the right
"
" n<C-PageUp>             Increase size of current split
" n<C-PageDown>           Decrease size of current split
"
" n<C-T>                  New tab (with same buffer)
" n<C-W>                  Close tab
" ni<C-X>                 Go to next tab
" ni<C-Z>                 Go to previous tab
"
" n<C-H/L/J/K>            Navigate to left/right/up/down split window
" n<C-X/Z>                Navigate to next/previous tab window
"
" n <space>/n/N/G         Keep cursor centered when jumping to search results
" nv<Up/Down/Left/Right>  Don't allow arrow keys in normal and visual mode
"
"
" n<leader>gs             Dublicate tab and launch :Gstatus with resized split
"
"
" Editing
" =========================================================
" n<leader>r              Search and replace in file the word under the cursor
" n<leader>f              Search in file the word under the cursor
" n<leader>hl             Toggle highlighting search results
" n<leader>ag             Start Ag in a new tab
" n<leader>tl             Start Ag in new tab and search for TODO
"
" n<leader>sc             Cycle through spell check languages/disable spell check
"
"
"
" C++ Editing
" =========================================================
" <F4>                    Switch header/source file (FileSwitch)
"
" n<leader>df             Format file with astyle
"
" <F7>                    Make project
" <S-F7>                  Make clean project
" n<C-Up/Down>            Open close error list after compile
" n<C-Left/Right>         Navigate to next/previous error
"
" n<leader>ct             Run Ctags
"
"
" niv<C-A>                Jumps to the next function parameter and marks it in visual mode
" i<C-D>d|1-0             Copy the function header from the preview window
"                           listed from YouCompleteMe
"
" i{                      Auto close curly bracket


 







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
Plugin 'gmarik/vundle'
Plugin 'Wh0p/FSwitch'
Plugin 'Wh0p/paraMark'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mrtazz/DoxygenToolkit.vim'
Plugin 'bling/vim-airline'
Plugin 'lervag/vim-latex'
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer'
filetype plugin indent on



" ================================================== 
" LEADER KEY
" ================================================== 
:let mapleader = ","
:let maplocalleader = "\\"



" ================================================== 
" Ad ignore docs
" ================================================== 
let g:ag_prg="ag --column --nogroup --noheading --ignore-dir=docs"
nnoremap <leader>ag :tabe<Cr>:Ag 
nnoremap <leader>tl :tabe<Cr>:Ag TODO<CR>



" ================================================== 
" CtrlP shortcuts and ignore
" ================================================== 
let g:ctrlp_user_command = 'ag %s -l --hidden -g "" --ignore-dir=.git'
let g:ctrlp_map = '<leader>p'
nnoremap <leader>o :tabe<CR>:CtrlP<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|build$\|docs$',
  \ 'file': '\.out$\|\.dat$'
  \ }
let g:ctrlp_working_path_mode = ''


" ================================================== 
" Fugitive shortcuts
" ================================================== 
nnoremap <leader>gs :tabe %<CR>:Gstatus<CR>:resize 30<CR>



" ================================================== 
" YouCompleteMe configs
" ================================================== 
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '!>'
let g:ycm_warning_symbol = 'o>'
let g:ycm_always_populate_location_list = 1
let g:ycm_add_preview_to_completeopt = 0
nnoremap <leader>cc :YcmDiag<CR>

" Make ycm and ultisnips play along
let g:ycm_key_list_select_completion=['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType='<C-n>'
let g:SuperTabCrMapping=0

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'



" ================================================== 
" Airline config
" ================================================== 
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = "⎇ "
let g:airline_symbols.paste = 'Þ'
let g:airline_left_sep = '⯈'
let g:airline_left_alt_sep = '>'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '<'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#left_sep = '⯈' 
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#right_sep = '◀' 
let g:airline#extensions#tabline#right_alt_sep = '<'



" ================================================== 
" YouCompleteMe configs
" ================================================== 
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '!>'
let g:ycm_warning_symbol = 'o>'
nnoremap <leader>cc :YcmDiag<CR>

" Make ycm and ultisnips play along
let g:ycm_key_list_select_completion=['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType='<C-n>'
let g:SuperTabCrMapping=0

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'



" ================================================== 
" paraMark mappings
" ================================================== 
nnoremap <C-A> :NextArg<CR>
inoremap <C-A> <ESC>:NextArg<CR>
vnoremap <C-A> <ESC>:NextArg<CR>

" Copy the parameter list for up to 10 different overloads
inoremap <C-D>d <ESC>:CpyParamList 1<CR>
inoremap <C-D>1 <ESC>:CpyParamList 1<CR>
inoremap <C-D>2 <ESC>:CpyParamList 2<CR>
inoremap <C-D>3 <ESC>:CpyParamList 3<CR>
inoremap <C-D>4 <ESC>:CpyParamList 4<CR>
inoremap <C-D>5 <ESC>:CpyParamList 5<CR>
inoremap <C-D>6 <ESC>:CpyParamList 6<CR>
inoremap <C-D>7 <ESC>:CpyParamList 7<CR>
inoremap <C-D>8 <ESC>:CpyParamList 8<CR>
inoremap <C-D>9 <ESC>:CpyParamList 9<CR>
inoremap <C-D>0 <ESC>:CpyParamList 0<CR>




" ================================================== 
" RACER
" ================================================== 
let g:racer_cmd="$HOME/.vim/bundle/racer/target/release/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src" 









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
" wrap lines but do not insert any line breaks
set wrap
set textwidth=0
set wrapmargin=0
" turn on syntax highlight with colorscheme candycode
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

" folds
set foldmethod=syntax
set foldlevel=0
set foldenable



" ================================================== 
" SPELLCHECKING
" ================================================== 
" Function for cycling through different spell checking configs.
let g:cycle_spell_check_indicator = 0
func! CycleSpellCheck()
  if g:cycle_spell_check_indicator == 0
    exec ":set nospell"
    echo "Spellchecking disabled."
    let g:cycle_spell_check_indicator = 1
  elseif g:cycle_spell_check_indicator == 1
    exec ":set spell spelllang=en_us"
    echo "Spellchecking enabled: EN_US"
    let g:cycle_spell_check_indicator = 2
  else
    exec ":set spell spelllang=de_de"
    echo "Spellchecking enabled: DE_DE"
    let g:cycle_spell_check_indicator = 0
  endif
endfunc

" enable spelling for git commits
autocmd Filetype gitcommit setlocal spell spelllang=en_us textwidth=72

" Call the CycleSpellCheck on startup once to initialize
call CycleSpellCheck()

nnoremap <leader>sc :call CycleSpellCheck()<CR>





" ================================================== 
" ASTYLE STUFF
" ================================================== 
" trim lines at the end of file
func! TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunc

" astyle formatting
func! FormatCode(cmd)
  let pos = getpos(".")
  exec "%!" . a:cmd
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos(".", pos)
endfunction

" set the shortcut only for code
if executable("astyle")
  let astyle = "astyle --style=allman --indent=spaces=2 --indent-switches --indent-namespaces --indent-preproc-define --indent-preproc-cond --indent-col1-comments --min-conditional-indent=0 --pad-oper --pad-header --unpad-paren --align-pointer=type --align-reference=type --convert-tabs --close-templates --break-after-logical" 
  
  autocmd Filetype cxx,cpp,c,h,hpp nnoremap <leader>df :call FormatCode(astyle)<CR>
endif




" ================================================== 
" EDITING
" ================================================== 
" search replace/find word under the cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>/
nnoremap <leader>f /\<<C-r><C-w>\>

let g:toggle_search_hl_indicator = 0
func! ToggleSearchHL()
  if g:toggle_search_hl_indicator == 0
    exec ":set hlsearch"
    echo "Search hightlight on"
    let g:toggle_search_hl_indicator = 1
  else
    exec ":set nohlsearch"
    echo "Search hightlight off"
    let g:toggle_search_hl_indicator = 0
  endif
endfunc

nnoremap <leader>hl :call ToggleSearchHL()<CR>

" auto close curly bracket
autocmd Filetype cxx,cpp,c,h,hpp,tex,bib inoremap { {}<ESC>i



" ================================================== 
" CURSOR MOVEMENT
" ================================================== 
" center screen with space, on search next/previous, GOTO line
nnoremap <space> zz
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz
set scrolloff=25

nnoremap <Up> <NOP>
vnoremap <Up> <NOP>
nnoremap <Down> <NOP>
vnoremap <Down> <NOP>
nnoremap <Left> <NOP>
vnoremap <Left> <NOP>
nnoremap <Right> <NOP>
vnoremap <Right> <NOP>




" ================================================== 
" WINDOW SPLITS AND TABS
" ================================================== 
" open new split planes to right and bottom
set splitbelow
set splitright
" remap split window navigation
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <silent> <C-PAGEUP> :wincmd +<CR>
nnoremap <silent> <C-PAGEDOWN> :wincmd -<CR>
"" tab cycle
nnoremap <C-X> :tabn<CR>
inoremap <C-X> <ESC>:tabn<CR>a
nnoremap <C-Z> :tabp<CR>
inoremap <C-Z> <ESC>:tabp<CR>a
" new tab, close tab
nnoremap <C-T> :tab split<CR>
nnoremap <C-W> :tabclose<CR>
" switch between header/source with F4
autocmd Filetype cxx,cpp,c,h,hpp noremap <F4> :FSHere<CR>








" ================================================== 
" LOAD SAVE KEYMAPS FILES
" ==================================================  
" save file
nnoremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR>a
" save all
nnoremap <C-S><C-A> :wa<CR>
inoremap <C-S><C-A> <ESC>:wa<CR>a
" save all, save session, exit all
nnoremap <C-E><C-E> :bd<CR>
nnoremap <C-E><C-A> :mks!<CR> :qa<CR>



" ================================================== 
" BUILD AND DEBUG KEYMAPS
" ==================================================  
" make project 
autocmd Filetype cxx,cpp,c,h,hpp map <F7> :make -C ./build/<CR>
" make clean
autocmd Filetype cxx,cpp,c,h,hpp map <S-F7> :make clean all -C ./build/<CR>
" open/close error list and navigate errors
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <C-Up> :cw<CR>
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <C-Down> :ccl<CR>
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <C-Left> :cp<CR>
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <C-Right> :cn<CR>

" open definition in new tab
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>



