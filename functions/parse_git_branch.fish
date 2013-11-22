
function parse_git_branch
  set -l fish_git_dirty_color red -o
  set -l fish_git_not_dirty_color green -o
  set -l fish_git_changed_color yellow -o
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)
  set -l git_stat (git status -s)
  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color) "[$branch]" (set_color normal)
  else if test -n "$git_stat"
    echo (set_color $fish_git_changed_color) "[$branch]" (set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color) "[$branch]" (set_color normal)
  end
end