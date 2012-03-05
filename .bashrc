c_reset='\[\e[0m\]'
c_user='\[\033[1;32m\]'
c_path='\[\e[0;34m\]'
c_prompt='\[\e[1;33m\]'
c_git_clean='\[\e[0;36m\]'
c_git_dirty='\[\e[1;31m\]'

parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
    if git diff --quiet 2>/dev/null >&2 
    then
      gitver="[${c_git_clean}$gitver${c_reset}]"
    else
      gitver="[${c_git_dirty}$gitver${c_reset}]"
    fi
  else
    return 0
  fi
  echo $gitver
}

# with hostname
#PROMPT_COMMAND='PS1="${c_user}\u${c_reset}@${c_user}\h${c_reset}:${c_path}\w${c_reset}$(parse_git_branch)${c_prompt} \$${c_reset} "'
# without hostname
PROMPT_COMMAND='PS1="${c_user}\u${c_reset}:${c_path}\w${c_reset}$(parse_git_branch)${c_prompt} \$${c_reset} "'

export CC=gcc-4.2

alias ls='ls -G --color'
alias ll='ls -l'
alias la='ls -a'
     
alias r='rails'
alias rs='rails server'
alias rsp='rails server -e production'
alias rt='rspec spec'

alias g='git'

[[ -s "/home/svd/.rvm/scripts/rvm" ]] && source "/home/svd/.rvm/scripts/rvm"  # This loads RVM into a shell session.
