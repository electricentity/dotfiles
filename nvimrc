" Install vim-plug if not installed
if !filereadable(expand("~/.config/nvim/autoload/plug.vim"))
    echo "Installing vim-plug and plugins. Restart vim after finishing the process."
    silent call mkdir(expand("~/.config/nvim/autoload", 1), 'p')
    execute "!curl -fLo ".expand("~/.config/nvim/autoload/plug.vim", 1)." https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall
endif

call plug#begin()
" Sensible defaults
Plug 'tpope/vim-sensible'
" Color schemes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
" Status bar
Plug 'bling/vim-airline'
" Tab completion
"Plug 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "context"
" Javascript
Plug 'marijnh/tern_for_vim', { 'do': 'npm install && wget https://raw.githubusercontent.com/Slava/tern-meteor/master/meteor.js -O node_modules/tern/plugin/meteor.js' }
let g:tern_map_keys=1
let g:tern_show_argument_hints="on_hold"
Plug 'pangloss/vim-javascript'
Plug 'slava/vim-spacebars'
" Syntax checking
Plug 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers=['eslint']
" Fuzzy finder
Plug 'kien/ctrlp.vim'
" Tree explorer
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
" Close NERDTree if only window remaining
autocmd bufenter *  if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Git wrapper
Plug 'tpope/vim-fugitive'
" Quoting / parens made easy
Plug 'tpope/vim-surround'
" Code completion engine
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
let g:ycm_autoclose_preview_window_after_completion=1
" Start page
Plug 'mhinz/vim-startify'
" Buffer explorer
Plug 'fholgado/minibufexpl.vim'
" Easymotion
Plug 'easymotion/vim-easymotion'
call plug#end()

let $TERM = "xterm-256color"
set t_Co=256
set background=dark
syntax enable
colorscheme gruvbox

" Set tabs
set tabstop=2
set shiftwidth=2
set expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab

let mapleader="\<Space>"

set nobackup
set noswapfile
set nowritebackup
 
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc
set title
set visualbell
set noerrorbells

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
set splitright
set splitbelow

" Easier escaping
:imap jk <Esc>
