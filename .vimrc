set nocompatible
filetype off

set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle " required!  Plugin 'gmarik/Vundle.vim'

 " My Plugins here:
 "
 " original repos on github
 Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
" Plugin 'tpope/vim-rails.git'
" Plugin 'ack.vim'
 Plugin 'sjl/badwolf'
 Plugin 'plasticboy/vim-markdown'
 Plugin 'groenewege/vim-less'
 Plugin 'editorconfig-vim'
 Plugin 'bling/vim-airline'
 Plugin 'airblade/vim-gitgutter'
 Plugin 'kien/ctrlp.vim'
 " vim-scripts repos
 " Plugin 'L9'
 " Plugin 'FuzzyFinder'
 Plugin 'scrooloose/NERDTree'
 Plugin 'scrooloose/NERDCommenter'
 Plugin 'scrooloose/syntastic'
 " Plugin 'digitaltoad/vim-jade'
 Plugin 'Tabular'
 "Plugin 'Shougo/neocomplete.vim'
 " Plugin 'Neocomplete'
 " non github repos
 " Plugin 'git://git.wincent.com/command-t.git'
 " ...
call vundle#end()            " required
filetype plugin indent on     " required!

set guifont       = "Menlo:12"
let g:colors_name = "badwolf"
set background    = "dark"

set modelines=0
syntax enable
set nu
set ruler

" remap arrow keys
noremap <Down> gj
noremap <Up> gk

" copy
vnoremap <C-c> "*y

" Command T settings
let g:CommandTInputDebounce = 200
let g:CommandTFileScanner = "watchman"
let g:CommandTWildIgnore = &wildignore . ",**/bower_components/*" . ",**/node_modules/*" . ",**/vendor/*"
let g:CommandTMaxHeight = 30
let g:CommandTMaxFiles = 500000

" CtrlP settings
let g:ctrlp_custom_ignore= &wildignore . '*/.git/*,*/.hg/*,*/.svn/*,*/bower_components/*,*/node_modules/*'

let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']


let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Necomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#syntax#min_keyword_length = 3

"Some tips from http://stevelosh.com/blog/2010/09/coming-home-to-vim/"

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
" set relativenumber
set cursorline

let mapleader = ","

"Custom settings
set nofoldenable    " disable folding
let g:vim_markdown_folding_disabled=1

" search remap
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" clear search
nnoremap <leader><space> :noh<cr>

" match the next brace
nnoremap <tab> %
vnoremap <tab> %
set wrap
set formatoptions=qrn1
set linebreak

" remap movement to move by column layout
nnoremap j gj
nnoremap k gk

"User customizations"

" Strips whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Select pasted text
nnoremap <leader>v V`]

"Window splitting remap"
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>q <C-w>s<C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j

" Buffers
nnoremap <leader>T :enew<cr>
nnoremap gy :bnext<CR>
nnoremap gt :bprevious<cr>
nnoremap gd :bdelete<cr>
nnoremap <leader>bl :ls<CR>

" Theme stuff
nnoremap <leader>1 :colorscheme obsidian<cr>
nnoremap <leader>2 :colorscheme tomorrow-night-bright<cr>
nnoremap <leader>3 :colorscheme molokai<cr>
nnoremap <leader>4 :colorscheme badwolf<cr>

" badwolf settings
let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 2
let g:badwolf_css_props_highlight = 1
let g:badwolf_html_link_underline = 1

" Airline settings
let g:airline#extensions#tabline#enabled =1
let g:airline_powerline_fonts=1
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.txt set filetype=markdown
autocmd BufRead,BufNewFile *.module set filetype=php
autocmd BufRead,BufNewFile *.install set filetype=php
autocmd BufRead,BufNewFile *.test set filetype=php
autocmd BufRead,BufNewFile *.inc set filetype=php
autocmd BufRead,BufNewFile *.profile set filetype=php
autocmd BufRead,BufNewFile *.view set filetype=php
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
autocmd BufRead,BufNewFile *.twig set ft=htmldjango
autocmd BufRead,BufNewFile *.rabl set ft=ruby
autocmd BufRead,BufNewFile *.jade set ft=jade

" Neocomplete filebased completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Whitespace fixes
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set undolevels=20
set title

set noerrorbells
set noswapfile
set nobackup
nnoremap ; :


" Tabular
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>

" Custom maps
set pastetoggle=<leader>p
nnoremap <leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

nnoremap <leader>vi :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>

" Save
noremap  <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Abbreviations
iabbrev adn and
iabbrev waht what
nnoremap H 00
nnoremap L $
inoremap jk <esc>

" Arrow keys
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

set fileformat=unix
set fileformats=unix,dos

" Abbreviations
"augroup abbreviations
    "autocmd!
    "autocmd FileType html :iabbrev <buffer> --- &mdash;
    "autocmd FileType javascript :iabbrev <buffer> ret return
"augroup END
set timeout
set ttimeout
set ttimeoutlen=0

set matchtime=0

