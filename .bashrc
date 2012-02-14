export PS1="\e[0;32m\u:\w\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\e[1;31m(\1)/')\e[0m \$ "
export CC=gcc-4.2

alias ls='ls -G --color'
alias ll='ls -l'
alias la='ls -a'
alias top='top -o cpu -O +rsize -s 5 -n 20'
     
alias r='rails'
alias rs='rails server'
alias rsp='rails server -e production'
alias rt='rspec spec'

[[ -s "/Users/svd/.rvm/scripts/rvm" ]] && source "/Users/svd/.rvm/scripts/rvm"  # This loads RVM into a shell session.
