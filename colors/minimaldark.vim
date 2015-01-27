" Name: minimal-theme.vim, A minimal theme based on xterm-256 color set
" Author: Amirreza Ghaderi <amirreza.blog@gmail.com>
" Version: 0.9
" License: Use of this source code is governed by the 'Revised BSD License'
"          which can be found in the LICENSE file.

" Commentary:
" Im not a big fan of syntax highlighting! to me, syntax highlighting is a 
" distraction! of course many programmers may not agree with this opinion,
" but for those who does, this is a VERY minimalistic color theme which use
" xterm-256 color set so it has a unified look in both GUI and Terminal.
" this theme comes in dark, and light version. 

set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "minimaldark"

" Black      :  016  :  #000000
" White      :  231  :  #ffffff
" Gray-bg    :  233  :  #121212
" Gray-txt   :  244  :  #808080
" Gray-cm    :  239  :  #4e4e4e
" Gray-ln    :  234  :  #1c1c1c
" Gray-sel   :  255  :  #eeeeee
" Red        :  160  :  #d70000
" Blue       :  066  :  #5f8787


hi Normal      ctermbg=233   ctermfg=244   guibg=#121212 guifg=#808080  term=NONE  cterm=NONE  gui=NONE  

hi Statement   ctermfg=244  guifg=#808080  ctermbg=NONE  guibg=NONE    term=bold  cterm=bold  gui=bold   
hi Type        ctermfg=244  guifg=#808080  ctermbg=NONE  guibg=NONE    term=bold  cterm=bold  gui=bold 
hi Function    ctermfg=244  guifg=#808080  ctermbg=NONE  guibg=NONE    term=NONE  cterm=NONE  gui=bold 
hi Special     ctermfg=244  guifg=#808080  ctermbg=NONE  guibg=NONE    term=NONE  cterm=NONE  gui=bold 
hi Comment     ctermfg=239  guifg=#4e4e4e  ctermbg=NONE  guibg=NONE    term=NONE  cterm=NONE  gui=bold 
hi Include     ctermfg=239  guifg=#4e4e4e  ctermbg=NONE  guibg=NONE    term=NONE  cterm=NONE  gui=bold 
hi String      ctermfg=066  guifg=#5f8787  ctermbg=NONE  guibg=NONE    term=NONE  cterm=NONE  gui=bold 

hi Todo        ctermfg=239   guifg=#4e4e4e  ctermbg=NONE  guibg=NONE       term=NONE  cterm=NONE  gui=NONE
hi StatusLine  ctermfg=233   guifg=#121212  ctermbg=244   guibg=#808080    term=NONE  cterm=NONE  gui=NONE 
hi ColorColumn ctermfg=244   guifg=#808080  ctermbg=NONE  guibg=NONE       term=NONE  cterm=NONE  gui=NONE 
hi LineNr      ctermfg=244   guifg=#808080  ctermbg=234   guibg=#1c1c1c    term=NONE  cterm=NONE  gui=NONE 
hi CursorLine  ctermfg=NONE  guifg=NONE     ctermbg=234   guibg=#1c1c1c    term=NONE  cterm=NONE  gui=NONE 
hi MatchParen  ctermfg=160   guifg=#d70000  ctermbg=NONE  guibg=NONE       term=bold  cterm=bold  gui=NONE 
hi Visual      ctermfg=None  guifg=None     ctermbg=16    guibg=#000000    term=None  cterm=None  gui=NONE
hi Pmenu       ctermfg=233   guifg=#121212  ctermbg=244   guibg=#808080    term=NONE  cterm=NONE  gui=NONE 
hi PmenuSel    ctermfg=233   guifg=#121212  ctermbg=255   guibg=#eeeeee    term=NONE  cterm=NONE  gui=NONE 


hi link Number      Normal 
hi link Keyword     Statement
hi link Operator    Normal
hi link Character   Normal
hi link Special     Normal
hi link Typedef     Type
hi link Boolean     Normal
hi link Macro       Normal

hi link htmlTag              Normal
hi link htmlEndTag           Normal
hi link htmlTagN             Statement
hi link htmlTagName          Statement
hi link htmlSpecialTagName   Statement
hi link htmlArg              Statement
hi link javaScriptMember     Normal

hi link vimOption Normal






