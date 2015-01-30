set nocompatible              " Turn off vi compatibility.
filetype off                  " required

set encoding=utf-8
scriptencoding utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Keep bundle commands between here and filetype plugin indent on.
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'

Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'sjl/gundo.vim'
Plugin 'ervandew/supertab'

Plugin 'fatih/vim-go'
Plugin 'tpope/vim-markdown'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'


filetype plugin indent on     " required


" General Settings
"-------------------------------------------------------------------------------
syntax on

set hidden            "enable hidden buffers (in background)
set title             "change the terminal's title

set showmode          "show the current mode
set number            "show line numbers
set laststatus=2      "always show status line
set ruler             "show the ruler bar
set scrolloff=7       "always keep some lines from edge of the screen
set cmdheight=1       "show 1 line for command line area

set colorcolumn=80    "show right margin
set cursorline        "highlight current line
set showmatch         "Show matchs

set expandtab         "use space for tabs
set tabstop=4         "tab width
set shiftwidth=4      "number of space for auto indention with >> or <<
set softtabstop=4     "number of spaces that <Tab> uses while editing
set smarttab          "smart tab
set ai                "Auto indent
set si                "Smart indet

"set nowrap            "don't wrap lines
set linebreak         "Break at word boundaries when wrapping
set showbreak=↪       "improve the display of line wrap

set ignorecase        "Ignore case when searching
set smartcase         "smart serach, combine it with :set ignorecase
set hlsearch          "Highlight search things
set incsearch         "Incremental search

set history=100       "remember 100 commands and search history
set undolevels=300    "levels of undo
set nobackup          "no backup
set noswapfile        "no swap files

set mouse=a           "enable mouse, in all modes
set mousemodel=popup  "enable mouse menu
if exists('$TMUX')    "Support resizing in tmux
   set ttymouse=xterm2
endif

set ttyfast           "improves redrawing
set visualbell        "don't beep
set noerrorbells      "don't beep

set clipboard=unnamed   " trying to use system clipboard

" Setup WildMenu
set wildmenu
set wildignore+=*/.git/*,*~,*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif 
set wildignore+=*.pdf,*.class,*.tar,*.gz,*.zip,*.jar,*.flv,*.mp3,tags
set wildmode=longest:full,full
if exists("&wildignorecase")
  set wildignorecase
endif


if has("gui_running")
  "Initial windows high and width
  set lines=35 columns=120
  
  "disable gui interfaces   
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions+=c
  
  set guifont=Fira\ Mono:h15
  set background=dark
  colorscheme minimaldark
else
  set t_Co=256                    
  set background=dark
  colorscheme minimaldark
endif


" General Key bindings
"-------------------------------------------------------------------------------
" change the mapleader from \ to space
let g:mapleader = "\<Space>"

" make ; be an alias for :
nnoremap ; :

" kill buffer
nnoremap <silent> <leader>k :bd!<CR>


" Visual mode
" ------------
" Tab: Indent
xmap <Tab> >

" shift-tab: unindent
xmap <s-tab> <

" <|>: Reselect visual block after indent
xnoremap < <gv
xnoremap > >gv

" Copy, Paste, Cut (works with system clipboard due to clipboard setting)
vnoremap <C-c> y`]
noremap <silent> <leader>y "+y <CR>:echo "Copy done!"<CR>
noremap <silent> <leader>p "+p <CR>:echo "Paste done!"<CR>
noremap <silent> <leader>x "+x <CR>:echo "Cut done!"<CR>

" Resizing Splits
nnoremap <silent> <S-h> 2<C-w><
nnoremap <silent> <S-j> 2<C-W>-
nnoremap <silent> <S-k> 2<C-W>+
nnoremap <silent> <S-l> 2<C-w>>

" Delete/Cut char send chars to black hole register.
noremap <silent> x "_x
noremap <silent> X "_X

" Easy save, even on insert mode.
nnoremap <leader>s :w<cr>
"inoremap <leader>s <C-c>:w<cr>

"neocomplcache
"-----------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" json = javascript syntax highlight
autocmd FileType json setlocal syntax=javascript


"Airline
"-----------------------
" No separator
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Disable modified detection
let g:airline_detect_modified = 0

" Disable detection of whitespace errors.
let g:airline#extensions#whitespace#enabled = 0

" Fix pause when leaving insert mode
set ttimeoutlen=50


" Unite
"----------------------
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case  = 1
let g:unite_enable_smart_case   = 1
let g:unite_enable_start_insert = 1
let g:unite_winheight           = 10
let g:unite_split_rule          = 'botright'
let g:unite_prompt              = '➤ '

call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Buffer search.
nnoremap <leader>o :Unite file<CR>

"File search.
nnoremap <leader>b :Unite buffer<CR>


