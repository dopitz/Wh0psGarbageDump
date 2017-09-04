" maui.vim: a new colorscheme by kryten

" Standard Initialization: {{{
set bg=dark
hi clear
if exists( "syntax_on")
  syntax reset
endif
let g:colors_name="mymaui"
" }}}

" Highlighting Commands: {{{
hi SpecialKey     cterm=bold      ctermfg=59    ctermbg=none            gui=bold      guifg=#5f5f5f   guibg=none
hi NonText        cterm=bold      ctermfg=59    ctermbg=none            gui=bold      guifg=#5f5f5f   guibg=none
hi Directory      cterm=bold      ctermfg=67    ctermbg=none            gui=bold      guifg=#5f87af   guibg=none
hi ErrorMsg       cterm=bold      ctermfg=199   ctermbg=none            gui=bold      guifg=#ff00af   guibg=none
hi IncSearch      cterm=underline ctermfg=178   ctermbg=255             gui=reverse   guifg=#1c1c1c   guibg=#ff8700    
hi Search         cterm=none      ctermfg=190   ctermbg=none            gui=none      guifg=#000000   guibg=none
hi MoreMsg        cterm=bold      ctermfg=229   ctermbg=none            gui=bold      guifg=#ffffaf   guibg=none
hi ModeMsg        cterm=bold      ctermfg=229   ctermbg=none            gui=bold      guifg=#ffffaf   guibg=none
hi LineNr         cterm=none      ctermfg=240   ctermbg=none            gui=none      guifg=#303030   guibg=none
hi CursorLineNr   cterm=bold      ctermfg=208   ctermbg=none            gui=bold      guifg=#ff8700   guibg=none
hi Question       cterm=standout  ctermfg=81    ctermbg=none            gui=standout  guifg=#5fdfff   guibg=none
hi StatusLine     cterm=bold      ctermfg=67    ctermbg=236             gui=bold      guifg=#5f87af   guibg=#303030
hi StatusLineNC   cterm=none      ctermfg=67    ctermbg=236             gui=none      guifg=#5f87af   guibg=#303030
hi VertSplit      cterm=none      ctermfg=255   ctermbg=236             gui=none      guifg=#5f87af   guibg=#303030
hi Title          cterm=bold      ctermfg=166   ctermbg=236             gui=bold      guifg=#df5f00   guibg=#303030
hi Visual         cterm=none      ctermfg=242   ctermbg=254             gui=none      guifg=#afafaf   guibg=#fdfdfd
hi VisualNOS      cterm=none      ctermfg=242   ctermbg=254             gui=none      guifg=#afafaf   guibg=#fdfdfd
hi WarningMsg     cterm=standout  ctermfg=231   ctermbg=238             gui=standout  guifg=#ffffff   guibg=#444444
hi WildMenu       cterm=standout  ctermfg=81    ctermbg=0               gui=standout  guifg=#5fdfff   guibg=#000000
hi Folded         cterm=none      ctermfg=244   ctermbg=none            gui=none      guifg=#808080   guibg=none
hi FoldColumn     cterm=standout  ctermfg=67    ctermbg=0               gui=standout  guifg=#5f87af   guibg=#000000
hi DiffAdd        cterm=bold      ctermfg=255   ctermbg=28              gui=bold      guifg=#ffffff   guibg=#1d3600
hi DiffChange     cterm=bold      ctermfg=255   ctermbg=142             gui=bold      guifg=#ffffff   guibg=#1d3600
hi DiffDelete     cterm=bold      ctermfg=255   ctermbg=52              gui=bold      guifg=#ffffff   guibg=#5f0000
hi DiffText       cterm=bold      ctermfg=255   ctermbg=238             gui=bold      guifg=#ffffff   guibg=#2a4f00
hi SignColumn     cterm=standout  ctermfg=118   ctermbg=235             gui=standout  guifg=#87ff00   guibg=#262626
hi Conceal        cterm=none      ctermfg=7     ctermbg=242             gui=none      guifg=#c0c0c0   guibg=#666666
hi SpellBad       cterm=underline ctermfg=196   ctermbg=52              gui=underline guifg=#ff0000   guibg=#340000
hi SpellCap       cterm=underline ctermfg=196   ctermbg=52              gui=underline guifg=#ff0000   guibg=#340000
hi SpellLocal     cterm=underline ctermfg=196   ctermbg=19              gui=underline guifg=#ff0000   guibg=#000034
hi Pmenu          cterm=none      ctermfg=81    ctermbg=0               gui=underline guifg=#5fdfff   guibg=#000000
hi PmenuSel       cterm=none      ctermfg=255   ctermbg=242             gui=underline guifg=#eeeeee   guibg=#666666
hi PmenuSbar      cterm=none      ctermfg=255   ctermbg=232             gui=underline guifg=#eeeeee   guibg=#808080
hi PmenuThumb     cterm=none      ctermfg=81    ctermbg=0               gui=underline guifg=#5fdfff   guibg=#000000
hi TabLine        cterm=underline ctermfg=255   ctermbg=242             gui=underline guifg=#ffffff   guibg=#666666
hi TabLineSel     cterm=bold      ctermfg=255   ctermbg=242             gui=bold      guifg=#ffffff   guibg=#666666
hi TabLineFill    cterm=reverse   ctermfg=255   ctermbg=242             gui=reverse   guifg=#ffffff   guibg=#666666
hi CursorColumn   cterm=none      ctermfg=0     ctermbg=255             gui=none      guifg=#0        guibg=#ffffff
hi CursorLine     cterm=none      ctermfg=none  ctermbg=236             gui=none      guifg=none      guibg=#afafaf
hi ColorColumn    cterm=none      ctermfg=none  ctermbg=255             gui=none      guifg=none      guibg=#ffffff
hi MatchParen     cterm=bold      ctermfg=51    ctermbg=none            gui=bold      guifg=#121212   guibg=none
hi Normal         cterm=none      ctermfg=252   ctermbg=none            gui=none      guifg=#d0d0d0   guibg=none
hi Cursor         cterm=none      ctermfg=0     ctermbg=253             gui=none      guifg=#151515   guibg=#dadada
hi Comment        cterm=none      ctermfg=34    ctermbg=none            gui=none      guifg=#cbff6f   guibg=none
hi SpecialComment cterm=bold      ctermfg=40    ctermbg=none            gui=bold      guifg=#8a8a8a   guibg=none
hi Constant       cterm=bold      ctermfg=161   ctermbg=none            gui=bold      guifg=#df005f   guibg=none
hi Identifier     cterm=none      ctermfg=67    ctermbg=none            gui=none      guifg=#5f87af   guibg=none
hi Statement      cterm=bold      ctermfg=166   ctermbg=none            gui=bold      guifg=#df5f00   guibg=none
hi PreProc        cterm=none      ctermfg=107   ctermbg=none            gui=none      guifg=#87af5f   guibg=none
hi Type           cterm=none      ctermfg=33    ctermbg=none            gui=none      guifg=#5f87df   guibg=none
hi StorageClass   cterm=none      ctermfg=32    ctermbg=none            gui=none      guifg=#5f87df   guibg=none
hi Special        cterm=none      ctermfg=67    ctermbg=none            gui=none      guifg=#5f87af   guibg=none
hi Ignore         cterm=none      ctermfg=244   ctermbg=232             gui=none      guifg=#808080   guibg=#808080
hi Todo           cterm=bold      ctermfg=40    ctermbg=none            gui=bold      guifg=#8a8a8a   guibg=none
hi Underlined     cterm=underline ctermfg=252   ctermbg=none            gui=underline guifg=#d0d0d0   guibg=none
hi Error          cterm=underline ctermfg=219   ctermbg=89              gui=underline guifg=#ffafff   guibg=#87005f
hi String         cterm=none      ctermfg=108   ctermbg=none            gui=none      guifg=#87af87   guibg=none
hi Character      cterm=none      ctermfg=144   ctermbg=none            gui=none      guifg=#afaf87   guibg=none
hi Number         cterm=none      ctermfg=209   ctermbg=none            gui=none      guifg=#5fafff   guibg=none
hi Float          cterm=none      ctermfg=209   ctermbg=none            gui=none      guifg=#5fafff   guibg=none
hi Boolean        cterm=none      ctermfg=208   ctermbg=none            gui=none      guifg=#ff8700   guibg=none
hi Function       cterm=none      ctermfg=37    ctermbg=none            gui=none      guifg=#8fb7df   guibg=none
hi Conditional    cterm=bold      ctermfg=208   ctermbg=none            gui=bold      guifg=#ff8700   guibg=none
hi Repeat         cterm=bold      ctermfg=161   ctermbg=none            gui=bold      guifg=#ff8700   guibg=#df005f
hi Label          cterm=none      ctermfg=229   ctermbg=none            gui=none      guifg=#ffffsf   guibg=none
hi Operator       cterm=none      ctermfg=161   ctermbg=none            gui=none      guifg=#df005f   guibg=none
hi Keyword        cterm=bold      ctermfg=161   ctermbg=none            gui=bold      guifg=#df005f   guibg=none
hi Exception      cterm=bold      ctermfg=107   ctermbg=none            gui=bold      guifg=#87af5f   guibg=none
hi Define         cterm=none      ctermfg=67    ctermbg=none            gui=none      guifg=#5fa7af   guibg=none
hi Macro          cterm=none      ctermfg=192   ctermbg=none            gui=none      guifg=#dfffaf   guibg=none
hi PreCondit      cterm=bold      ctermfg=107   ctermbg=none            gui=bold      guifg=#87af5f   guibg=none
hi Structure      cterm=none      ctermfg=81    ctermbg=none            gui=none      guifg=#5fdfff   guibg=none
hi Typedef        cterm=none      ctermfg=81    ctermbg=none            gui=none      guifg=#5fdfff   guibg=none
hi Tag            cterm=bold      ctermfg=161   ctermbg=none            gui=bold      guifg=#df005f   guibg=none
hi SpecialChar    cterm=bold      ctermfg=161   ctermbg=none            gui=bold      guifg=#df005f   guibg=none
hi Delimiter      cterm=none      ctermfg=67    ctermbg=none            gui=none      guifg=#5f87af   guibg=none
hi Debug          cterm=bold      ctermfg=225   ctermbg=none            gui=none      guifg=#ffdfff   guibg=none

hi diffRemoved    cterm=bold      ctermfg=none  ctermbg=52              gui=bold      guifg=none      guibg=#5f0000
hi link diffAdded DiffAdd

hi link gitKeyword Function
hi link gitIdentity Title
hi link gitDate PreProc

hi IndentGuidesOdd guibg=#151515 ctermbg=233
hi IndentGuidesEven guibg=#080808 ctermbg=232

hi SyntasticError         term=reverse gui=bold,underline cterm=bold,underline guifg=#ffafff ctermfg=219 guibg=#303030 ctermbg=236
hi SyntasticWarning       term=standout gui=bold,underline cterm=bold,underline guifg=#ff00af ctermfg=199 guibg=#262626 ctermbg=235
hi SyntasticWarningLine guibg=#262626 ctermbg=235
hi SyntasticErrorLine guibg=#303030 ctermbg=236
hi SyntasticWarningSign ctermfg=yellow guibg=#121212 ctermbg=233
hi SyntasticErrorSign ctermfg=red guibg=#121212 ctermbg=233
" }}}

set bg=dark "bg switches to light for some reason
