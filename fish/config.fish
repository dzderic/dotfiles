# don't display the default greeting
set fish_greeting ""

# add homebrew to $PATH
set PATH /usr/local/bin $PATH

# aliases
alias ls='gls --color=auto'
alias l='ls'
alias ll='ls -lh'
alias la='ls -la'
alias dzdo='sudo'
alias sl='sl -e'

# editor settings
set -x EDITOR vim
set -x PSQL_EDITOR 'vim -c "set ft=sql"'

eval (dircolors -c ~/.dircolors)

# configure virtualenv support
. ~/.config/fish/virtualfish/virtual.fish
. ~/.config/fish/virtualfish/auto_activation.fish

test -f ~/.config/fish/local.fish ; and . ~/.config/fish/local.fish
