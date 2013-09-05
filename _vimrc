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
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'VimClojure'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'uggedal/go-vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'vcscommand.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'SudoEdit.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'takac/vim-commandcaps'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
NeoBundle 'kevinw/pyflakes-vim'

" Bundle installation check.
NeoBundleCheck

" =========
" Shortcuts
" =========
let mapleader=","             " change the leader to be a comma vs slash

" sudo write this
cnoremap W! SudoWrite

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" vcscommand shortcuts
" committing
nmap <leader>vc :VCSCommit<CR>
" checking status
nmap <leader>vs :VCSStatus<CR>
" checking logs
nmap <leader>vl :VCSLog<CR>
" diffing
nmap <leader>vd :VCSDiff<CR>
" blaming
nmap <leader>vb :VCSBlame<CR>

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

" Ack searching
nmap <leader>a <Esc>:Ack!

" Load the Gundo window
map <leader>u :GundoToggle<CR>

" Easier than ':set paste'
map <leader>p :set paste!<CR>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
"
" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Map space to insert a space and leave insert mode
nmap <Space> i <Esc>l

" align by equal sign
vnoremap <silent> <leader>a :Tabularize /=<CR>

" <leader>c for commenting out
noremap <silent> <leader>c :TComment<cr>

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

set grepprg=ack         " replace the default grep program with ack

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
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

" =====
" Hacks
" =====
" Handle mintty's escape sequences
let &t_ti.="^[[?7727h"
let &t_te.="^[[?7727l"
noremap <Esc>O[ <Esc>
noremap! <Esc>O[ <Esc>

" Make esc+key == <M-key>
for i in range(65,90) + range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
endfor

" Make colors work
let &t_Co=256
colorscheme solarized
set term=screen-256color

" ===========================================================
" FileType specific changes
" ============================================================
" JSON
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
"
" Markdown
autocmd BufNewFile,BufRead *.md setlocal ft=markdown

" Gradle
autocmd BufNewFile,BufRead *.gradle setlocal ft=groovy

" Mako/HTML/Django
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Puppet
autocmd FileType puppet setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Python
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Ruby
au FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Javascript
au FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2

" Haskell
au FileType haskell set shiftwidth=2 tabstop=2 softtabstop=2

" Clojure options
let vimclojure#ParenRainbow = 1

" ==============
" Other settings
" ==============
" Unite.vim config
let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_prompt = '» '
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" use fuzzy matcher for unite-outline
call unite#custom#source('outline', 'matchers', ['matcher_fuzzy'])

" Unite.vim key bindings
nnoremap <C-p> :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank -start-insert history/yank<cr>
nnoremap <leader>s :<C-u>Unite -no-split -buffer-name=grep -start-insert grep:.:-iR<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>

" make esc happen in insert mode without waiting for timeoutlen
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

" window resizing mappings
nnoremap <M-k> :call Resize('+', 5)<CR>
nnoremap <M-j> :call Resize('-', 5)<CR>
nnoremap <M-h> :call Resize('<', 5)<CR>
nnoremap <M-l> :call Resize('>', 5)<CR>

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
