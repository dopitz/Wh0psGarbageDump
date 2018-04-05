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
" n <space>/n/N/G         Keep cursor centered when jumping to search results
" nv<Up/Down/Left/Right>  Don't allow arrow keys in normal and visual mode
"
"
" n<leader>gs             Dublicate tab and launch :Gstatus with resized split
"
"
" :Wipeout                Delete all buffers that are not currently active
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
" ABLE VI COMPATIBILITY 
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
Plug 'Wh0p/FSwitch'
Plug 'Wh0p/paraMark'
Plug 'Wh0p/cyclespellcheck'
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
Plug 'octol/vim-cpp-enhanced-highlight' 
Plug 'beyondmarc/glsl.vim'
Plug 'Konfekt/FastFold'
" Initialize plugin system
call plug#end()

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1


" ================================================== 
" LEADER KEY
" ================================================== 
:let mapleader = ","
:let maplocalleader = "\\"



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
" PLUGIN  --  paraMark
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
let g:cpp_class_scope_highlight = 0
let g:cpp_member_variable_highlight = 0
let g:cpp_class_decl_highlight = 0



" ================================================== 
" PLUGIN  --  Doxy
" ================================================== 
nnoremap <leader>dx :Dox<CR>



" ================================================== 
" PLUGIN  --  vimtex
" ================================================== 
let g:vimtex_quickfix_latexlog = {'fix_paths':0}



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

augroup git_commits
  au!
  " enable spelling for git commits
  autocmd Filetype gitcommit setlocal spell spelllang=en_us textwidth=72
  " enable spelling for tex files
  autocmd Filetype tex setlocal spell spelllang=en_us wrap linebreak textwidth=0 wrapmargin=0
augroup END




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
  
  augroup clang_format
    au!
    autocmd Filetype cxx,cpp,c,h,hpp nnoremap <leader>df :call ClangFormatFile()<CR>
    autocmd Filetype cxx,cpp,c,h,hpp nnoremap <leader>dd :pyf /usr/share/vim/addons/syntax/clang-format.py<CR>
  augroup END
endif




" ================================================== 
" EDITING
" ================================================== 
nnoremap <C-Z> <nop>
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
  autocmd Filetype cxx,cpp,c,h,hpp,tex,bib inoremap { {}<ESC>i
augroup END

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
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

nnoremap <leader>cy y:call ClipboardYank()<CR>
vnoremap <leader>cy y:call ClipboardYank()<CR>
nnoremap <leader>cp :call ClipboardPaste()<CR>
vnoremap <leader>cp :call ClipboardPaste()<CR>


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
" save file
nnoremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR>a
" save all
nnoremap <C-S-S> :wa<CR>:mksession!<CR>:echo "Saved all, updated session."<CR>
inoremap <C-S-S> <ESC>:wa<CR>:mksession!<CR>:echo "Saved all, updated session."<CR>a
" save all, save session, exit all
nnoremap <C-E><C-E> :bd<CR>

nnoremap <C-Q><C-S> :!rm Session.vim<CR> :qa<CR>
nnoremap <C-Q><C-Q> :qa<CR>

