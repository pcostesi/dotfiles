if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
