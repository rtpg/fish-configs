function fish_prompt
         printf '%s@%s %s%s%s' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
         if test -d .git
            printf '%s' (parse_git_branch)
         end
         printf '>'
end