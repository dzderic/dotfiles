" https://github.com/dzderic/dotfiles/
" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" Pyflakes
" Ack

" ==========================================================
" Plugins included
" ==========================================================
" Pathogen
"     Better Management of VIM plugins
"
" GunDo
"     Visual Undo in vim with diff's to check the differences
"
" PyFlakes
"     Underlines and displays errors with Python on-the-fly
"
" Git
"    Syntax highlighting for git config files
"
" Pydoc
"    Opens up pydoc within vim
"
" ==========================================================
" Shortcuts
" ==========================================================
set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" sudo write this
cmap W! w !sudo tee % >/dev/null

" Toggle the tasklist
map <leader>td <Plug>TaskList

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" copying to clipboard
nmap <leader>cb :w !xclip -i -selection clipboard<CR><CR>

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

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

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

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Ack searching
nmap <leader>a <Esc>:Ack!

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ==========================================================
" Basic Settings
" ==========================================================
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

" Make syntastic nicer
let g:syntastic_enable_signs=0
let g:syntastic_check_on_open=1

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.so,*.swp,*.o,*.obj,.git,*.pyc,.svn,.hg
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

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

"""" Display
let &t_Co=256
colorscheme solarized

set term=screen-256color

" Paste from clipboard
map <leader>p "+p

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
"
" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

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
autocmd BufNewFile,BufRead *.pp call Pl#Load()
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

" Unite.vim config
let g:unite_source_history_yank_enable = 1
let g:unite_winheight = 10
let g:unite_prompt = '» '
call unite#filters#matcher_default#use(['matcher_fuzzy'])

if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt = ''
endif

if executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt = ''
endif

nnoremap <C-p> :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>s :<C-u>Unite -no-split -buffer-name=grep grep:.<cr>

" Window resizing mappings
nnoremap <M-k> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <M-j> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <M-h> :normal <c-r>=Resize('<')<CR><CR>
nnoremap <M-l> :normal <c-r>=Resize('>')<CR><CR>
function! Resize(dir)
  let this = winnr()
  if '+' == a:dir || '-' == a:dir
    execute "normal <c-w>k"
    let up = winnr()
    if up != this
      execute "normal <c-w>j"
      let x = 'bottom'
    else
      let x = 'top'
    endif
  elseif '>' == a:dir || '<' == a:dir
    execute "normal <c-w>h"
    let left = winnr()
    if left != this
      execute "normal <c-w>l"
      let x = 'right'
    else
      let x = 'left'
    endif
  endif
  if ('+' == a:dir && 'bottom' == x) || ('-' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>+"
  elseif ('-' == a:dir && 'bottom' == x) || ('+' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>-"
  elseif ('<' == a:dir && 'left' == x) || ('>' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w><"
  elseif ('>' == a:dir && 'left' == x) || ('<' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w>>"
  else
    echo "oops. check your ~/.vimrc"
    return ""
  endif
endfunction

let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" Map space to insert a space and leave insert mode
nmap <Space> i <Esc>l

command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
vnoremap <silent> <Leader>a :Align<CR>
function! AlignSection(regex) range
  let extra = 1
  let sep = empty(a:regex) ? '=' : a:regex
  let maxpos = 0
  let section = getline(a:firstline, a:lastline)
  for line in section
    let pos = match(line, ' *'.sep)
    if maxpos < pos
      let maxpos = pos
    endif
  endfor
  call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
  call setline(a:firstline, section)
endfunction

function! AlignLine(line, sep, maxpos, extra)
  let m = matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
  if empty(m)
    return a:line
  endif
  let spaces = repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
  return m[1] . spaces . m[2]
endfunction
