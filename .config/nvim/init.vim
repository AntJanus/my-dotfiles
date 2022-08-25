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

" gui colors
if (has("termguicolors"))
  set termguicolors
endif

let mapleader = ","

set dir=~/.swap-files

call plug#begin('~/.local/share/nvim/plugged')
 " themes
 " Plug 'whatyouhide/vim-gotham'
 " Plug 'flazz/vim-colorschemes'
 " Plug 'kyoz/purify', { 'rtp': 'vim' }
 Plug 'dracula/vim', { 'name': 'dracula' }
 Plug 'mhartington/oceanic-next'

 " Git plugin
 Plug 'tpope/vim-fugitive'

 " Syntax checker
  Plug 'w0rp/ale'

 " Tabnine
 " Plug 'codota/tabnine-vim'

 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'honza/vim-snippets'

 " main plugins
 Plug 'groenewege/vim-less'
 Plug 'editorconfig/editorconfig-vim'
 Plug 'bling/vim-airline'
 Plug 'scrooloose/NERDTree'
 Plug 'scrooloose/NERDCommenter'

 " languages
 Plug 'pangloss/vim-javascript'
 " Plug 'mxw/vim-jsx'
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
" Plug '~/.fzf'
 Plug 'junegunn/fzf'
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
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
:silent! colorscheme Dracula
let g:airline_theme='dracula'
" let g:vim_jsx_pretty_colorful_config = 1 " default 0

" remap arrow keys
noremap <Down> gj
noremap <Up> gk

" copy
vnoremap <C-c> "*y

"""" Coc
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-tsserver', 'coc-prettier', 'coc-elixir', 'coc-fzf-preview', 'coc-yaml', 'coc-styled-components', 'coc-snippets']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Should I add like a \"c\" prefix to indicate it's CoC?
" so it'd be \"cd\" to go to definition?
" Go to definition
function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gl :call <SID>GoToDefinition()<CR>

nnoremap gh <Plug>(coc-references)
nnoremap gr <Plug>(coc-rename)

""" SNIPPETS

let g:coc_snippet_next = '<tab>'

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
"""" /Coc

" ALE settings
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_php_cs_fixer_use_global=1
let g:ale_php_phpcs_use_global=1
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_linter_aliases = {'typescriptreact': 'typescript', 'javascriptreact': 'javascript'}
let g:ale_fixer_aliases = {'typescriptreact': 'typescript', 'javascriptreact': 'javascript'}


let g:ale_linters={
\'css': ['prettier'],
\'elixir': ['mix_format'],
\'graphql': ['prettier'],
\'html': ['prettier'],
\'javascript': ['eslint'],
\'json': ['prettier'],
\'php': ['phpcs', 'prettier'],
\'typescript': ['eslint', 'prettier'],
\'typescriptreact': ['eslint', 'prettier'],
\'vim': ['prettier']
\}
let g:ale_fixers={
\'css': ['prettier'],
\'elixir': ['mix_format'],
\'graphql': ['prettier'],
\'javascript': ['eslint'],
\'html': ['prettier'],
\'json': ['prettier'],
\'php': ['php_cs_fixer', 'prettier'],
\'typescript': ['eslint', 'prettier'],
\'typescriptreact': ['eslint', 'prettier'],
\'vim': ['prettier']
\}
let g:ale_fix_on_save=1

" FZF settings
nnoremap <leader>t :Files<CR>
nnoremap <leader>g :Rg<CR>

call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])

set statusline+=%#warningmsg#
set statusline+=%*
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

"Some tips from http://stevelosh.com/blog/2010/09/coming-home-to-vim/"

set tabstop=2
set softtabstop=2
set shiftwidth=2
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
set colorcolumn=80

"Folding
set nofoldenable    " disable folding
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

" Go
let g:go_fmt_autosave = 1

