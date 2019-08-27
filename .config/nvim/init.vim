" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Daniel Opitz 
"
"
"
" Keymaps by this file:
"
" Open/Close, Navigate Windows/Tabs
" =========================================================
" n<leader>p              Launch CtrlP
" n<leader>o              Launch CtrlP in new tab
"
" ni<C-S>                 Save file
"
" nJ                      Move cursor to split window above
" nK                      Move cursor to split window below
" nH                      Move cursor to split window to the left
" nL                      Move cursor to split window to the right
" n<C-PAGEUP>             Increase size of current split
" n<C-PAGEDOWN>           Decrease size of current split
"
" n<C-T>                  New tab (with same buffer)
" n<C-W>                  Close tab
" ni<C-K>                 Go to next tab
" ni<C-J>                 Go to previous tab
"
" n<C-H/L/J/K>            Navigate to left/right/up/down split window
" n<C-X/Z>                Navigate to next/previous tab window
"
" n<C-B>                  Toggles Tagbar
" n<C-G>                  Opens Tagbar with auto close
"
"
" n <space>/n/N/G         Keep cursor centered when jumping to search results
" nv<Up/Down/Left/Right>  Don't allow arrow keys in normal and visual mode
"
"
" :Wipe                   Delete all buffers that are not currently active
"
" n<leader>gs             Open git status in new tab
" n<leader>gd             Open git diff in new tab
" n<leader>gg             Toggle git gutter
"
"
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
" n zf                    fold by current search expression
" n zi                    fold by indent
" n zs                    fold by syntax
"
" n<leader>df             Auto format file (with clang-format, rustfmt)
"
"
"
" C++ Editing
" =========================================================
" <F4>                    Switch header/source file (FileSwitch)
"
" <F7>                    Make project
" <S-F7>                  Make clean project
" n<C-Up/Down>            Open close error list after compile
" n<C-Left/Right>         Navigate to next/previous error
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
" n<leader>def            Show the documentation in the preview window (:YcmCompleter GoToDefinition)
" n<leader>dec            Show the documentation in the preview window (:YcmCompleter GoToDeclaration)
" n<leader>cp             Close the preview window (:pclose)

 







" ================================================== 
" ENABLE VI COMPATIBILITY 
" ================================================== 
set nocompatible



"" ================================================== 
"" PLUGINS
"" ================================================== 
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/vimplug')
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'dopitz/FSwitch'
Plug 'dopitz/cyclespellcheck'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'bling/vim-airline'
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'octol/vim-cpp-enhanced-highlight' 
Plug 'beyondmarc/glsl.vim'
Plug 'Konfekt/FastFold'
Plug 'majutsushi/tagbar'
" Initialize plugin system
call plug#end()


" ================================================== 
" LEADER KEY
" ================================================== 
:let mapleader = ","
:let maplocalleader = "\\"



" ================================================== 
" PLUGIN - cycle spell check
" ================================================== 
let g:cycle_spell_check_modes = ["en_us", "de_de"]
let g:cycle_spell_check_indicator = len(g:cycle_spell_check_modes)

nnoremap <leader>sc :call CycleSpellCheck()<CR>

augroup spelling
  au!
  " enable spelling for git commits
  autocmd Filetype gitcommit setlocal spell spelllang=en_us textwidth=105
  " enable spelling for tex files
  autocmd Filetype tex setlocal spell spelllang=en_us wrap linebreak textwidth=0 wrapmargin=0
augroup END



" ================================================== 
" PLUGIN - fast fold
" ================================================== 
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1



" ================================================== 
" PLUGIN  --  Ag
" ================================================== 
let g:ag_prg="ag --column --nogroup --noheading --ignore-dir=docs"
nnoremap <leader>ag :tabe<Cr>:Ag 
nnoremap <leader>tl :tabe<Cr>:Ag TODO<CR>



" ================================================== 
" PLUGIN  --  CtrlP 
" ================================================== 
let g:ctrlp_user_command = 'ag %s -l --hidden -g "" --ignore-dir=.git'
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>o :tabe<CR>:CtrlP<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|build$\|docs$',
  \ 'file': '\.out$\|\.dat$'
  \ }
let g:ctrlp_working_path_mode = 0



" ================================================== 
" PLUGIN  --  Fugitive
" ================================================== 
nnoremap <leader>gs :tabe %<CR>:Gstatus<CR>:resize 30<CR>
nnoremap <leader>gd :Gdiff<CR>



" ================================================== 
" PLUGIN  --  Gitgutter
" ================================================== 
nnoremap <leader>gg :GitGutterToggle<CR>



" ================================================== 
" PLUGIN  --  YouCompleteMe
" ================================================== 
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '!>'
let g:ycm_warning_symbol = 'o>'
let g:ycm_always_populate_location_list = 1
let g:ycm_add_preview_to_completeopt = 0

nnoremap <leader>cc :YcmDiag<CR>
nnoremap <leader>doc :YcmCompleter GetDoc<CR>
nnoremap <leader>def :YcmCompleter GoToDefinition<CR>
nnoremap <leader>Def :tab split<CR> :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dec :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>Dec :tab split<CR> :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>fix :YcmCompleter FixIt<CR>
nnoremap <leader>cr :YcmRestartServer<CR>

" Make ycm and ultisnips play along
let g:ycm_key_list_select_completion=['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType='<C-n>'
let g:SuperTabCrMapping=0

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'



" ================================================== 
" PLUGIN  --  Airline
" ================================================== 
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = "⎇ "
let g:airline_symbols.paste = 'Þ'
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '>'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '<'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#right_sep = '◀' 
let g:airline#extensions#tabline#right_alt_sep = '<'



" ================================================== 
" CPP-highlight enhancer
" ================================================== 
let g:cpp_class_scope_highlight = 0
let g:cpp_member_variable_highlight = 0
let g:cpp_class_decl_highlight = 0



" ================================================== 
" PLUGIN  --  Rust
" ================================================== 
let g:rust_recommended_style = 0



" ================================================== 
" PLUGIN  --  vimtex
" ================================================== 
let g:vimtex_compiler_progname = 'nvr'



" ================================================== 
" PLUGIN  --  Tagbar
" ================================================== 
nnoremap <C-B> :TagbarToggle<CR>
nnoremap <C-G> :TagbarOpenAutoClose<CR>

let g:tagbar_type_rust = {
   \ 'ctagstype' : 'rust',
   \ 'kinds' : [
       \'T:types,type definitions',
       \'f:functions,function definitions',
       \'g:enum,enumeration names',
       \'s:structure names',
       \'m:modules,module names',
       \'c:consts,static constants',
       \'t:traits',
       \'i:impls,trait implementations',
   \]
   \}



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
augroup auto_fold
  au!
  autocmd Filetype cxx,cpp,c,h,hpp setlocal foldmethod=syntax
  autocmd Filetype rust setlocal foldmethod=expr
  autocmd Filetype python setlocal foldmethod=indent
augroup END

set foldenable
set foldexpr=GetFold(v:lnum)
set foldlevel=0
set foldcolumn=0

function! GetFold(lnum)
  "get string of current line
  let this_line=getline(a:lnum)

  let pprev_i=indent(a:lnum - 2)/&shiftwidth
  let prev_i=indent(a:lnum - 1)/&shiftwidth
  let this_i=indent(a:lnum)/&shiftwidth

  " comments
  if this_line =~? '^\s*\/\/\/.*'
    return this_i + 1
  endif

  " something like indent folding, but includes the closing bracket line to the
  " fold eg:
  " struct A {          struct {                  struct {
  "   a                   folded content            folded content
  "   b                                           }
  " }
  " TODO: breaks when there is no blank line between two structs...

  if empty(this_line) 
    if prev_i < pprev_i
      return prev_i
    endif
    return -1
  endif 

  if this_i < prev_i
    return prev_i
  endif

  return this_i
endfunction

nnoremap zf :set foldexpr=getline(v:lnum)!~@/ foldmethod=expr foldlevel=0<CR><CR>:FastFoldUpdate<CR>
nnoremap zi :set foldexpr=GetFold(v:lnum) foldmethod=expr foldlevel=0<CR><CR>:FastFoldUpdate<CR>
nnoremap zs :set foldmethod=syntax foldlevel=0<CR><CR>:FastFoldUpdate<CR>


" automatically reload file if chenages detected
set autoread




" ================================================== 
" FORMAT
" ================================================== 
func! ClangFormatFile()
  let cursorp = getpos('.')
  silent exec ":%!clang-format"
  call setpos('.', cursorp)
endfunc

augroup auto_format
  au!
  if executable("clang-format")
      autocmd Filetype cxx,cpp,c,h,hpp nnoremap <leader>df :call ClangFormatFile()<CR>
  endif
  autocmd Filetype rust nnoremap <leader>df :RustFmt<CR>
augroup END




" ================================================== 
" EDITING
" ================================================== 
nnoremap <C-Z> <nop> " get rid of the suspend process
" search replace/find word under the cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>/
nnoremap <leader>f /\<<C-r><C-w>\>
augroup cursor_movement
  au!
  " Highlight the word under the current cursor position
  autocmd CursorMoved * exe printf('match Search /\V\<%s\>/', escape(expand('<cword>'), '/\'))
augroup END

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

augroup close_brackets
  au!
  " auto close curly bracket
  autocmd Filetype cxx,cpp,c,h,hpp,tex,bib,rust inoremap { {}<ESC>i
augroup END


function! WipeoutBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  for b in range(1, bufnr('$'))
    if (bufloaded(b) && !has_key(visible, b)) || ((!bufloaded(b)) && buflisted(bufname(b)))
      let l:tally += 1
      exe 'bd ' . b
    endif
  endfor
  echon "Deleted " . l:tally . " buffers"
endfun
command! Wipe :call WipeoutBuffers()


" Move to next fold and expand it
nnoremap zt zjzx
nnoremap zT zkzx



" ================================================== 
" CURSOR MOVEMENT
" ================================================== 
" center screen with space, on search next/previous, GOTO line
nnoremap <space> zz
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz
set scrolloff=25

" disable the arrow keys in normal mode
nnoremap <Up> <NOP>
vnoremap <Up> <NOP>
nnoremap <Down> <NOP>
vnoremap <Down> <NOP>
nnoremap <Left> <NOP>
vnoremap <Left> <NOP>
nnoremap <Right> <NOP>
vnoremap <Right> <NOP>

" make j, k, 0 and $ operate on displayed lines rather than physical lines
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
nnoremap <C-L> :tabn<CR>
inoremap <C-L> <ESC>:tabn<CR>a
nnoremap <C-H> :tabp<CR>
inoremap <C-H> <ESC>:tabp<CR>a
nnoremap <C-K> :tabn<CR>
inoremap <C-K> <ESC>:tabn<CR>a
nnoremap <C-J> :tabp<CR>
inoremap <C-J> <ESC>:tabp<CR>a
" new tab, close tab
nnoremap <C-T> :tab split<CR>
nnoremap <C-W> :tabclose<CR>
augroup switch_headder_src
  au!
  " switch between header/source with F4
  autocmd Filetype cxx,cpp,c,h,hpp noremap <F4> :FSHere<CR>
augroup END








" ================================================== 
" LOAD SAVE KEYMAPS FILES
" ==================================================  
" save all
nnoremap <C-S> :wa<CR>:mksession!<CR>:echo "Saved all, updated session."<CR>
inoremap <C-S> <ESC>:wa<CR>:mksession!<CR>:echo "Saved all, updated session."<CR>a
