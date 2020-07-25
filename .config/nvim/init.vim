set nocompatible
filetype off

" set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>
set backspace=indent,eol,start
set swapfile
set autoread

if &term =~ '256color'
  set t_ut=
endif

let mapleader = ","

set dir=~/.swap-files

call plug#begin('~/.local/share/nvim/plugged')
 " themes
 " Plug 'whatyouhide/vim-gotham'
 " Plug 'flazz/vim-colorschemes'
 " Plug 'kyoz/purify', { 'rtp': 'vim' }
 Plug 'dracula/vim', { 'name': 'dracula' }

 " Git plugin
 Plug 'tpope/vim-fugitive'

 " Syntax checker
  Plug 'w0rp/ale'
  Plug 'Shougo/deoplete.nvim'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

 " main plugins
 Plug 'groenewege/vim-less'
 Plug 'editorconfig/editorconfig-vim'
 Plug 'bling/vim-airline'
 Plug 'scrooloose/NERDTree'
 Plug 'scrooloose/NERDCommenter'

 " languages
 Plug 'pangloss/vim-javascript'
 Plug 'mxw/vim-jsx'
 Plug 'maxmellon/vim-jsx-pretty'
 Plug 'HerringtonDarkholme/yats.vim'
 " Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

 Plug 'leafgarland/typescript-vim'
 Plug 'jparise/vim-graphql'
 Plug 'cespare/vim-toml'
 Plug 'slashmili/alchemist.vim'
 Plug 'elixir-editors/vim-elixir'

 " PHP
 Plug 'StanAngeloff/php.vim'

 " Fuzzy search
 Plug '~/.fzf'
 Plug 'junegunn/fzf.vim'

call plug#end()            " required

filetype plugin indent on     " required!
let g:jsx_ext_required = 1


set modelines=0
syntax enable
set nu
set ruler

" Colors
set background=dark
:silent! colorscheme dracula
" let g:vim_jsx_pretty_colorful_config = 1 " default 0

" remap arrow keys
noremap <Down> gj
noremap <Up> gk

" copy
vnoremap <C-c> "*y

" Syntax checking and completion

" ALE settings
let g:ale_completion_enabled = 1
let g:ale_php_cs_fixer_use_global=1
let g:ale_php_phpcs_use_global=1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

let g:ale_linters={
\'css': ['prettier'],
\'elixir': ['mix_format'],
\'graphql': ['prettier'],
\'html': ['prettier'],
\'javascript': ['prettier', 'eslint'],
\'json': ['prettier'],
\'php': ['phpcs', 'prettier'],
\'typescript': ['prettier'],
\'vim': ['prettier']
\}
let g:ale_fixers={
\'css': ['prettier'],
\'elixir': ['mix_format'],
\'graphql': ['prettier'],
\'javascript': ['prettier', 'eslint'],
\'html': ['prettier'],
\'json': ['prettier'],
\'php': ['php_cs_fixer', 'prettier'],
\'typescript': ['prettier'],
\'vim': ['prettier']
\}
let g:ale_fix_on_save=1

" Deoplete settings
 let g:deoplete#enable_at_startup=1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" LanguageClient settings
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['typescript-language-server --stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

" FZF settings
nnoremap <leader>t :Files<CR>

call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])

set statusline+=%#warningmsg#
set statusline+=%*
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

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

" Airline settings
let g:airline#extensions#tabline#enabled =1
let g:airline_powerline_fonts=1
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

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

augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

set undolevels=20
set title

set noerrorbells
set noswapfile
set nobackup
nnoremap ; :

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
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Go
let g:go_fmt_autosave = 1

