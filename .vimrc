" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible                " choose no compatibility with legacy vi

" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set encoding=utf-8

" ================ Whitespace =======================
set nowrap                      " don't wrap lines
set linebreak    "Wrap lines at convenient points
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)

" turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","
let maplocalleader = "\\"

" =============== Vundle Initialization ===============
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" General text editing improvements...
Bundle "tomtom/tcomment_vim.git"
Bundle "mattn/emmet-vim"
Bundle "AndrewRadev/coffee_tools.vim"
" Bundle "niquola/vim-pg"

" Cosmetics, color scheme, Powerline...
Bundle "altercation/vim-colors-solarized.git"
Bundle "bling/vim-airline.git"

" Syntax Highlighters
Bundle "othree/html5.vim"
Bundle "Bazai/css.vim"
Bundle "skammer/vim-css-color"
Bundle "hail2u/vim-css3-syntax"
Bundle "groenewege/vim-less"
Bundle "kchmck/vim-coffee-script.git"
Bundle "godlygeek/tabular"
Bundle "plasticboy/vim-markdown"
Bundle "slim-template/vim-slim.git"
Bundle "tpope/vim-fireplace"
Bundle "guns/vim-clojure-static"
Bundle "guns/vim-clojure-highlight"
Bundle "ekalinin/Dockerfile.vim"

" General vim improvements
" Bundle "scrooloose/nerdtree.git"
Bundle "kien/ctrlp.vim"
Bundle "Lokaltog/vim-easymotion"
Bundle "tpope/vim-vinegar"
Bundle "tpope/vim-surround"
Bundle "michaeljsmith/vim-indent-object"
Bundle "christoomey/vim-tmux-navigator"
Bundle "guns/vim-sexp"

"Filetype plugin indent on is required by vundle
filetype plugin indent on

" ================ Bundle plugins settings ==============
" surround.vim auto indentation
let g:surround_indent = 1

" === Airline settings
set laststatus=2

" Color Theme
let g:airline_theme='hybrid'

" Symbols Replacement
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '¶ '
" let g:airline_linecolumn_prefix = '¶ '

" let g:airline_fugitive_prefix = '⎇ '
" let g:airline_paste_symbol = 'ρ'

" Sections Replacements
let g:airline_section_c = '%t'

" === CtrlP settings
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 1

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<CR>

" Additional mapping for buffer search
" nnoremap <silent> ,b :CloseSingleConque<CR>:CtrlPBuffer<cr>
" nnoremap <silent> <C-b> :CloseSingleConque<CR>:CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <C-P> :ClearCtrlPCache<cr>

" ==== Vim Sexp settings

" ==== Solarized colorscheme
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
filetype plugin indent on       " load file type plugins + indentation

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
" set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Searching =======================
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" ================ Auto line breaking =======================
set cc=80
set tw=79

" ================ Keymaps  =======================
"(v)im (e)dit
nnoremap ,ve :vsplit $MYVIMRC<cr>
"(v)im (r)eload
nnoremap ,vr :source $MYVIMRC<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Command-/ to toggle comments
map <C-/> :TComment<CR>
imap <C-/> <Esc>:TComment<CR>i

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, I, N
" (note that  I use I and N instead of J and K because  J already does
" line joins and K is mapped to GitGrep the current word
" nnoremap <silent> <C-h> <C-w>h
" nnoremap <silent> <C-l> <C-w>l
" nnoremap <silent> <C-k> <C-w>k
" nnoremap <silent> <C-j> <C-w>j

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap ,vv <C-w>v
nnoremap ,ss <C-w>s
" Close tab
nnoremap ,ww <C-w>q

" " Ctrl-N for nerd tree
" nmap <C-N> :NERDTreeToggle<CR>
" " Open the project tree and expose current file in the nerdtree with Ctrl-\
" nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical res 30<CR>

" Cancelled NERDTree to :Explore advantage
" nmap <C-N> :Explore<cr>

" Copy and cut visual selection to !pbcopy
vmap ,x :!pbcopy<CR>
vmap ,c :!pbcopy<BAR>pbpaste<CR>

" Toggle paste mode
nnoremap ,sp :set invpaste paste?<CR>
set pastetoggle=,sp

" Reindent current file
map == ggVG=''

map ,e :%Eval<cr>
