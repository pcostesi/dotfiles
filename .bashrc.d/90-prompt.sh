
PS1="$RED\$(get_ret_code)$LIGHT_GRAY\u@\h $LIGHT_GREEN\$(date '+%H:%M (%d/%m/%Y)') $BLUE\$(parse_core_temp) \n\
\w$YELLOW \$(parse_git_branch)$LIGHT_GREEN\$ $LIGHT_GRAY"
