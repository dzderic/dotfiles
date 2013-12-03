function fish_prompt
  set_color purple
  echo -n $USER
  set_color cyan
  echo -n '@'
  set_color yellow
  echo -n (hostname -s)

  set_color normal
  echo -n ' '

  set_color $fish_color_cwd
  echo -n (prompt_pwd)' '

  if set -q VIRTUAL_ENV
    echo -n -s (set_color blue) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end

  set_color normal
  echo -n '> '
end
