set nocompatible              " be awesome

" =========
" NeoBundle
" =========
" Set up NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
let g:neobundle#types#git#default_protocol = 'http'

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles to install
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'make -f make_mingw32.mak',
  \   'cygwin'  : 'make -f make_cygwin.mak',
  \   'mac'     : 'make -f make_mac.mak',
  \   'unix'    : 'make -f make_unix.mak',
  \    },
  \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'VimClojure'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'vcscommand.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'SudoEdit.vim'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'takac/vim-commandcaps'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'vim-coffee-script'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'jceb/vim-orgmode'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'elzr/vim-json'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'tommcdo/vim-lion'
NeoBundle 'dag/vim-fish'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'wellle/targets.vim'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

" Bundle installation check.
NeoBundleCheck

" =========
" Shortcuts
" =========
let mapleader=","             " change the leader to be a comma vs slash
let maplocalleader=","        " change the localleader to also be a comma vs slash

" sudo write this
cnoremap W! SudoWrite

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" change the vcscommand prefix from '<leader>c'
let g:VCSCommandMapPrefix = '<leader>v'

" fugitive shortcuts
" committing
nmap <leader>gc :Gcommit<CR>
" checking status
nmap <leader>gs :Gstatus<CR>
" checking logs
nmap <leader>gl :Glog<CR>
" diffing
nmap <leader>gd :Gdiff<CR>
" blaming
nmap <leader>gb :Gblame<CR>
" pushing
nmap <leader>gp :Git push<CR>

" ctrl-{jklm} changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Toggle line numbers
map <leader>b :set number!<CR>

" Load the Gundo window
map <leader>u :GundoToggle<CR>

" Easier than ':set paste'
map <leader>p :set paste!<CR>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Map space to insert a space and leave insert mode
nmap <Space> i <Esc>l

" Map tab to indent in insert and visual modes
nmap <Tab> >>
vmap <Tab> >>
nmap <S-Tab> <<
vmap <S-Tab> <<

" align by equal sign
vmap <leader>a gl=
nmap <leader>a glip=

" make the Q key more useful
noremap Q @q

" diff sections of text
map <leader>d :Linediff<CR>

" underline current line
nnoremap <Leader>= yypVr=
nnoremap <Leader>- yypVr-
nnoremap <Leader># yypVr#

" ==============
" Basic settings
" ==============
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set nrformats-=octal          " Don't treat numbers with leading zeroes as octal

" Some GUI settings
set guifont=Ubuntu\ Mono\ 12  " much better font
set guioptions-=m             " remove menu bar
set guioptions-=T             " remove toolbar
set guioptions-=r             " remove right-hand scroll bar
set guioptions-=L             " remove left-hand scroll bar

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.so,*.swp,*.o,*.obj,.git,*.pyc,.svn,.hg
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest
set pumheight=6             " Keep a small completion window

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set nosmartindent           " Smart indent breaks Python indenting
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" don't outdent hashes
inoremap # #

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=%<%f\ %h%m%r%=%l,%c%V\ %P

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

""" Undo settings
set undofile             " Save undo's after file closes
set undodir=~/.vim/undo  " where to save undo histories
set undolevels=1000      " How many undos
set undoreload=10000     " number of lines to save for undo

if !isdirectory(&l:undodir)
  call mkdir(&l:undodir)
endif

" =====
" Hacks
" =====
" Handle mintty's escape sequences
noremap <Esc>O[ <Esc>
noremap! <Esc>O[ <Esc>

" Make esc+key == <M-key>
for i in range(65,90) + range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
endfor

" Make colors work
let &t_Co=256
colorscheme base16-ocean

" Use a shell that vim works with (ie. not fish)
if executable('zsh')
  set shell=zsh
else
  set shell=bash
endif

" ===========================================================
" FileType specific changes
" ============================================================
au BufNewFile,BufRead *.md setlocal ft=markdown               " markdown
au BufNewFile,BufRead *.gradle setlocal ft=groovy             " gradle
au BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html  " mako/html/django
au BufNewFile,BufRead cronjobs.* setlocal ft=crontab          " crontab

au FileType html,xhtml,xml,css,htmldjango,handlebars.html,puppet,ruby,javascript,coffee,haskell,fish,vim,markdown setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" ==============
" Other settings
" ==============
" Unite.vim config
let g:unite_source_rec_max_cache_files=10000
let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_prompt = '» '
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" use fuzzy matcher for unite-outline
call unite#custom#source('outline', 'matchers', ['matcher_fuzzy'])

" use ag for searching
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \  '--line-numbers --nocolor --nogroup --hidden --ignore ' .
  \  '.hg --ignore .svn --ignore .git --ignore .bzr ' .
  \  '--ignore node_modules --ignore bower_components'
  let g:unite_source_grep_recursive_opt = ''

  let g:unite_source_rec_async_command =
  \  'ag --nocolor --nogroup --ignore .hg --ignore .svn ' .
  \  '--ignore .git --ignore .bzr --ignore node_modules ' .
  \  '--ignore bower_components --hidden -g ""'
endif

" Unite.vim key bindings
nnoremap <C-p> :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank -start-insert history/yank<cr>
nnoremap <leader>s :<C-u>Unite -no-split -buffer-name=grep -start-insert grep:.:-iR<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>

" Clojure options
let vimclojure#ParenRainbow = 1

" make esc happen in insert mode without waiting for timeoutlen
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=300
augroup END

" make supertab smart by default
let g:SuperTabDefaultCompletionType = "context"

" get jedi to create new windows in splits
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "bottom"

let g:org_todo_keywords=['TODO', 'PROGRESS', '|', 'DONE', 'WASTE']

" window resizing mappings
nnoremap <M-k> :call Resize('+', 5)<CR>
nnoremap <M-j> :call Resize('-', 5)<CR>
nnoremap <M-h> :call Resize('<', 5)<CR>
nnoremap <M-l> :call Resize('>', 5)<CR>

" configure syntastic
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_javascript_checkers = []
let g:syntastic_java_checkers = []
let g:syntastic_enable_signs = 0
let g:syntastic_check_on_open = 1
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" don't hide some chars in json files
let g:vim_json_syntax_conceal = 0

" configure airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_eighties'

" Add the virtualenv's site-packages to vim path
if has('python') && !empty($VIRTUAL_ENV)
py << EOF
import os.path
import sys
import vim
project_base_dir = os.environ['VIRTUAL_ENV']
sys.path.insert(0, project_base_dir)
activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))
EOF
endif

function! WindowPosition(dir)
  let this = winnr()  " current window number

  if a:dir == 'horizontal'
    " go up, and check if we haven't moved
    execute 'wincmd k'
    if this == winnr() | return 'top' | endif

    " reset
    execute this . 'wincmd w'

    " go down, and check if we haven't moved
    execute 'wincmd j'
    if this == winnr() | return 'bottom' | endif

    " reset
    execute this . 'wincmd w'

    " we're in the middle
    return 'middle'
  elseif a:dir == 'vertical'
    " go left, and check if we haven't moved
    execute 'wincmd h'
    if this == winnr() | return 'left' | endif

    " reset
    execute this . 'wincmd w'

    " go right, and check if we haven't moved
    execute 'wincmd l'
    if this == winnr() | return 'right' | endif

    " reset
    execute this . 'wincmd w'

    " we're in the middle
    return 'middle'
  endif
endfunction

function! Resize(dir, n)
  if a:dir == '+' || a:dir == '-'
    let pos = WindowPosition('horizontal')
    let opp = (a:dir == '+') ? '-' : '+'  " opposite of `dir`

    if pos == 'top' || pos == 'middle'
      execute "resize " . opp . a:n
    elseif pos == 'bottom'
      execute "resize " . a:dir . a:n
    endif
  elseif a:dir == '<' || a:dir == '>'
    let pos = WindowPosition('vertical')
    let vdir = (a:dir == '<') ? '+' : '-'  " direction we pass to `resize`
    let opp = (a:dir == '<') ? '-' : '+'   " opposite of `dir`

    if pos == 'left' || pos == 'middle'
      execute "vertical resize " . opp . a:n
    elseif pos == 'right'
      execute "vertical resize " . vdir . a:n
    endif
  endif
endfunction

" Toggle syntastic error window
function! ToggleErrors()
  if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
    " No location/quickfix list shown, open syntastic error location panel
    Errors
  else
    lclose
  endif
endfunction

nnoremap <silent> <Leader>e :<C-u>call ToggleErrors()<cr>
