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
" ni<C-K>                 Go to next tab
" ni<C-J>                 Go to previous tab
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
" n<leader>zl             Toggle folds for all c-Style comments
" n<leader>zL             Expand all folds recoursivly and then collaps folds for all c-Style comments
"
" nv<leader>cy           Copy to clipboard register
" nv<leader>cp           Paste from clipboard register
"
"
"
" C++ Editing
" =========================================================
" <F4>                    Switch header/source file (FileSwitch)
"
" n<leader>df             Format file with clang-format
" n<leader>dd             Format file with clang-format
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
"
" n<leader>cf             Automatically fix error as suggested by YouCompleteMe (:YouCompleter FixIt)
" n<leader>doc            Show the documentation in the preview window (:YcmCompleter GetDoc)
" n<leader>cp             Close the preview window (:pclose)

 







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
Plugin 'Wh0p/cyclespellcheck'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mrtazz/DoxygenToolkit.vim'
Plugin 'bling/vim-airline'
Plugin 'lervag/vim-latex'
Plugin 'rust-lang/rust.vim'
Plugin 'octol/vim-cpp-enhanced-highlight' 
Plugin 'beyondmarc/glsl.vim'
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
let g:ctrlp_working_path_mode = 0


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
nnoremap <leader>doc :YcmCompleter GetDoc<CR>
nnoremap <leader>cf :YcmCompleter FixIt<CR>
nnoremap <leader>cp :pc<CR>



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
" CPP-highlight enhancer
" ================================================== 
let g:cpp_class_scope_highlight = 1









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
" turn on syntax highlight with colorscheme
set t_Co=256
syntax on
colorscheme mymaui
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
set guifont=Liberation\ Mono\ 10

" folds
set foldmethod=syntax
set foldlevel=0
set foldenable

" automatically reload file if chenages detected
set autoread



" ================================================== 
" SPELLCHECKING
" ================================================== 
let g:cycle_spell_check_modes = ["en_us", "de_de"]

nnoremap <leader>sc :call CycleSpellCheck()<CR>

" enable spelling for git commits
autocmd Filetype gitcommit setlocal spell spelllang=en_us textwidth=72
" enable spelling for tex files
autocmd Filetype tex setlocal spell spelllang=en_us wrap linebreak textwidth=0 wrapmargin=0




" ================================================== 
" CLANG FORMAT
" ================================================== 
func! ClangFormatFile()
  let cursorp = getpos('.')
  silent exec ":%!clang-format"
  call setpos('.', cursorp)
endfunc

if executable("clang-format")
  let clangfmt = "clang-format"
  
  autocmd Filetype cxx,cpp,c,h,hpp nnoremap <leader>df :call ClangFormatFile()<CR>
  autocmd Filetype cxx,cpp,c,h,hpp nnoremap <leader>dd :pyf /usr/share/vim/addons/syntax/clang-format.py<CR>
endif

autocmd BufNewFile,BufReadPost *.cl set filetype=cpp




" ================================================== 
" EDITING
" ================================================== 
" search replace/find word under the cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>/
nnoremap <leader>f /\<<C-r><C-w>\>
" Highlight the word under the current cursor position
:autocmd CursorMoved * exe printf('match Search /\V\<%s\>/', escape(expand('<cword>'), '/\'))

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

" cold comments
func! ToggleFoldComments()
  let p = getpos(".")
  call setpos(".", [p[0], 1, 1, 0])

  let last_p = search("\\/\\*\\*")
  exec "normal! za"
  while (last_p != search("\\/\\*\\*"))
    exec "normal! za"
  endwhile

  call setpos(".", p)
endfunc
nnoremap zl :call ToggleFoldComments()<CR>
nnoremap zL zMzR:call ToggleFoldComments()<CR>

" Copy to/Paste from clipboard
nnoremap <leader>cy "+y
vnoremap <leader>cy "+y
nnoremap <leader>cp "+p
vnoremap <leader>cp "+p




" ================================================== 
" CURSOR MOVEMENT
" ================================================== 
" center screen with space, on search next/previous, GOTO line
nnoremap <space> zz
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz
set scrolloff=25

" disable the arrow keys in normal mode, 'cause they suck dick
nnoremap <Up> <NOP>
vnoremap <Up> <NOP>
nnoremap <Down> <NOP>
vnoremap <Down> <NOP>
nnoremap <Left> <NOP>
vnoremap <Left> <NOP>
nnoremap <Right> <NOP>
vnoremap <Right> <NOP>

" make j, k, 0 and $ operate on displayed lines rather than physical lines.
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> 0 g0
noremap <silent> $ g$




" ================================================== 
" WINDOW SPLITS AND TABS
" ================================================== 
" open new split planes to right and bottom
set splitbelow
set splitright
" remap split window navigation
nnoremap <silent> J :wincmd j<CR>
nnoremap <silent> K :wincmd k<CR>
nnoremap <silent> H :wincmd h<CR>
nnoremap <silent> L :wincmd l<CR>
nnoremap <silent> <C-PAGEUP> :wincmd +<CR>
nnoremap <silent> <C-PAGEDOWN> :wincmd -<CR>
"" tab cycle
nnoremap <C-K> :tabn<CR>
inoremap <C-K> <ESC>:tabn<CR>a
nnoremap <C-J> :tabp<CR>
inoremap <C-J> <ESC>:tabp<CR>a
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
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <leader>ct :!ctags -R .<CR>
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>





