set nocompatible               " be iMproved

" Setting up Vundle - the vim plugin bundler
filetype off                  " required!
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'

    "Add your bundles here
    "uber awesome syntax and errors highlighter
    Bundle 'Syntastic'

    " T-H-E colorscheme
    Bundle 'altercation/vim-colors-solarized' 

    " So awesome, it should be illegal 
    Bundle 'https://github.com/tpope/vim-fugitive' 

    " Recognize all .md files as markdown
    Bundle 'tpope/vim-markdown'

    " Instant markdown preview
    " Bundle 'suan/vim-instant-markdown'

    " Twiki syntax highlighting
    Bundle 'https://github.com/vim-scripts/TWiki-Syntax'

    " Vim surround
    Bundle 'https://github.com/tpope/vim-surround'

    " Vim repeat: allow plugins to repeat with . (notable Vim surround)
    Bundle 'https://github.com/tpope/vim-repeat'

    " Commenting :)
    Bundle 'tomtom/tcomment_vim'

    " Text filtering and alignment
    Bundle 'https://github.com/godlygeek/tabular'

    " SQL indentation and other goodies (requires the Vim-Align dependency)
    Bundle 'https://github.com/vim-scripts/SQLUtilities'
    Bundle 'https://github.com/vim-scripts/Align'

    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
filetype plugin indent on     " required!
" Setting up Vundle - the vim plugin bundler end




" Allow for filetype disovery by adding a line in a file: #vim: set ft=ruby
set modelines=0
set modeline

let mapleader = ","

" Tab settings
set expandtab
set smartindent
set ts=2 sts=2 sw=2

" Default wrapping (gq to wrap)
set tw=79
set formatoptions+=t
set linebreak

" Syntax Highlighting on
syntax on

" Filetype settings
au FileType python set ts=4 sts=4 sw=4 textwidth=79 foldmethod=indent foldlevel=99
au FileType html set textwidth=200
au FileType java set ts=4 sts=4 sw=4
au FileType markdown set ts=4 sts=4 sw=4

" Go code.
augroup go
  autocmd BufReadPre,FileReadPre      *.go  set tabstop=4
  autocmd BufReadPre,FileReadPre      *.go  set expandtab
augroup END

" show incomplete command in the lower right corner for when i forget insane vim commands
set showcmd

" * General Settings
scriptencoding utf-8
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set numberwidth=3
set nowrap
try
    set relativenumber
    set undofile
catch
    set number
endtry

" Tame searching/moving
set ignorecase
set smartcase
"set gdefault " global serach replace not working if set as default?
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Set the terminal title
set title

" Set to auto read when a file is changed from the outside
set autoread

" Make saving easier
set autowrite
autocmd BufLeave,FocusLost * silent! wall
nmap <leader>w :w!<cr>
nmap <M-s> <ESC> :w<CR>

" Enter command mode when focus is lost
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

" Folding
set nofoldenable
set fdm=indent

" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Fold tag
nnoremap <leader>ft Vatzf

" Reselected pasted text
nnoremap <leader>v V`]

" Search
nnoremap <leader>a :Ack 

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Command-T
" let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc,*.orig,*.swp,*.un~,node_modules,vendor/bundle,tmp/cache

noremap <leader>y :CommandTFlush<cr>

" Execute Pyhton file being edited with LEADER ee
map <buffer> <leader>ee :w<CR>:!/usr/bin/env python % <CR>

" Center screen around cursor with SPACE
nmap <space> zz

" JSlint highlighting
map <Leader>l :JSLintLight<CR>

" Open current document in browser
map <Leader>p :!open %<CR><CR>

" Shortcut to copy to clipboard
map <Leader>vv "*y

" Shortcut to compile coffeescript
noremap <leader>cw :w<CR>:!coffee -c %<CR>

" Set yankring history file dir
let g:yankring_history_dir = '$HOME/.vim'

" Enable Sparkup for lightning-fast HTML editing
let g:sparkupExecuteMapping = '<leader>e'
let g:sparkupNextMapping = '<c-x>' " Prevent issues with tabbing/tab-expansion

" Toggle NERDTree
noremap <Leader>d :NERDTreeToggle<CR>

" Customize status line
set statusline=%<%F%h%m%r%h%w%y\ [%{&fo}]\ col:%c%V\ line:%l\,%L\ %P

if has("gui_running")
    set guioptions=egmrt
    set guioptions-=r
endif

" Reload vimrc if anything is written to it
au! BufWritePost .vimrc source %

" Automaticalle compile .coffee files on write
" By default we pass in the --bare option
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow

" Log a time entry with Leader ll
:map <Leader>ll :r!date<CR> A: 

" Visual marker at end of textwidth
set colorcolumn=+5
