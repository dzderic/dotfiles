function fish_prompt
  # $user@$host
  echo -n -s (set_color purple) $USER (set_color cyan) '@' (set_color yellow) (hostname -s)

  # $cwd
  echo -n -s ' ' (set_color green) (prompt_pwd) ' '

  if set -q VIRTUAL_ENV  # display the virtualenv if we're in one
    echo -n -s (set_color blue) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end

  set -l git_branch (git rev-parse --symbolic-full-name --abbrev-ref HEAD ^/dev/null)
  if test -n "$git_branch"
    echo -n -s (set_color red) '(' $git_branch ') '

    if not test -z (echo (git status --porcelain))
      echo -n '± '
    end
  end

  echo -n -s (set_color normal) '➙  '
end
