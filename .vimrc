set nocompatible
filetype off

" set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>
set backspace=indent,eol,start

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
 " required!
 Plugin 'gmarik/Vundle.vim'

 " My Plugins here:
 "
 " original repos on github
 Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
" Plugin 'tpope/vim-rails.git'
" Plugin 'ack.vim'

 " themes
 Plugin 'w0rp/ale'
 Plugin 'sjl/badwolf'
 Plugin 'jacoborus/tender'
 Plugin 'whatyouhide/vim-gotham'
 Plugin 'morhetz/gruvbox'

 Plugin 'tpope/vim-markdown'
 Plugin 'jtratner/vim-flavored-markdown'
 Plugin 'groenewege/vim-less'
 Plugin 'editorconfig-vim'
 Plugin 'bling/vim-airline'
 " Plugin 'airblade/vim-gitgutter'
 Plugin 'kien/ctrlp.vim'
 " vim-scripts repos
 " Plugin 'L9'
 " Plugin 'FuzzyFinder'
 Plugin 'scrooloose/NERDTree'
 Plugin 'scrooloose/NERDCommenter'
 " Plugin 'scrooloose/syntastic'
 Plugin 'Tabular'
 Plugin 'pangloss/vim-javascript'
 Plugin 'mxw/vim-jsx'
 Plugin 'mhartington/nvim-typescript'
 " Plugin 'leafgarland/typescript-vim'
 " non github repos
 " Plugin 'git://git.wincent.com/command-t.git'
 " ...
call vundle#end()            " required
filetype plugin indent on     " required!

set guifont       = "Menlo:12"
let g:colors_name = "gruvbox"
set background=dark

if &term =~ '256color'
  set t_ut=
endif

set modelines=0
syntax enable
set nu
set ruler

" remap arrow keys
noremap <Down> gj
noremap <Up> gk

" copy
vnoremap <C-c> "*y

" Ale
let g:ale_completion_enabled = 1

" CtrlP settings
"
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']  " Windows

" ALE

set statusline+=%#warningmsg#
set statusline+=%{ALEGetStatusLine()}
set statusline+=%*
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Syntastic
" let g:syntastic_javascript_checkers = ['']

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

"Some tips from http://stevelosh.com/blog/2010/09/coming-home-to-vim/"

set tabstop=2
set softtabstop=2
set shiftwidth=4
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
set laststatus=2
set number
set cursorline

let mapleader = ","

"Folding
set foldenable    " disable folding
set foldnestmax=10
set foldmethod=indent

" open and close folds
nnoremap <space> za
nnoremap <space>o zA

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
nnoremap <leader><space> :nohlsearch<cr>

" highlight last inserted text
nnoremap vG `[v`]

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
let g:airline_theme = 'tender'
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

augroup file_types
    autocmd!
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
    autocmd BufRead,BufNewFile *.ts set ft=typescript syntax=typescript
    autocmd BufRead,BufNewFile *.es6 set ft=javascript syntax=javascript
    autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
    autocmd BufRead,BufNewFile *.twig set ft=htmldjango
    autocmd BufRead,BufNewFile *.rabl set ft=ruby
    autocmd BufRead,BufNewFile *.jade set ft=jade
augroup END

" Whitespace fixes
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

augroup whitespace
    autocmd!
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

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
nnoremap <leader>re gg=G

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

set fileformat=unix
set fileformats=unix,dos

" Abbreviations
"augroup abbreviations
    "autocmd!
    "autocmd FileType html :iabbrev <buffer> --- &mdash;
    "autocmd FileType javascript :iabbrev <buffer> ret return
"augroup END
"
"ConEmu settings

if !empty($CONEMUBUILD)
  set termencoding=utf8
  set term=xterm
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"

  " set codes for dynamic cursor type with vim modes
  let &t_te="\e[0 q"
  let &t_ti="\e[1 q"
  let &t_EI="\e[1 q"
  let &t_SI="\e[5 q"
  let &t_SR="\e[3 q"

  "scrollwheel
  inoremap <Esc>[62~ <C-X><C-E>
  inoremap <Esc>[63~ <C-X><C-Y>
  nnoremap <Esc>[62~ <C-E>
  nnoremap <Esc>[63~ <C-Y>

  "fancy airline stuff
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

endif

" Tender
if (has("termguicolors"))
  set termguicolors
endif

" Go
let g:go_fmt_autosave = 0

