set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'


" Keep bundle commands between here and filetype plugin indent on.
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'

Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/unite.vim'
Bundle 'tpope/vim-commentary'
Bundle 'godlygeek/tabular'
Bundle 'sjl/gundo.vim'

Bundle 'Blackrush/vim-gocode' 
Bundle 'tpope/vim-markdown'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'



filetype plugin indent on     " required


" General Settings
"-------------------------------------------------------------------------------
syntax on

set encoding=utf-8    "use utf8 for text encoding
set hidden            "enable hidden buffers (in background)
set title             "change the terminal's title

set showmode          "show the current mode
set number            "show line numbers
set laststatus=2      "always show status line
set ruler             "show the ruler bar
set scrolloff=7       "always keep some lines from edge of the screen
set cmdheight=1       "show 1 line for command line area

set colorcolumn=100   "show right margin
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


"Setup WildMenu
set wildmenu
set wildignore+=*~,*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif 
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
  
  set guifont=Menlo:h14
  set background=dark
  colorscheme solarized
else
  set t_Co=256                    
  set background=dark
  colorscheme solarized
endif


" General Key bindings
"-------------------------------------------------------------------------------
" change the mapleader from \ to ,
let mapleader = "\<Space>"

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

" Map space to the prefix for Unite
" nnoremap [unite] <Nop>
" nmap <space> [unite]

" Quick buffer search
nnoremap <silent> <leader>b :<C-u>Unite -buffer-name=buffers buffer<CR>

" Quick file search
nnoremap <silent> <leader>o :<C-u>Unite -buffer-name=files file_rec file/new<CR>

" Quickly switch lcd
nnoremap <silent> <leader>d :<C-u>Unite -buffer-name=change-cwd -default-action=cd directory_rec<CR>

" Quick commands
" nnoremap <silent> <leader>c :<C-u>Unite -buffer-name=commands command<CR>



