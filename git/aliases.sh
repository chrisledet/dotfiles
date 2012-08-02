alias gl="git log --pretty=format:'%C(yellow)%h%Creset %Cgreen%an%Creset %s %C(yellow)%d%Creset %Cred(%ar)' --graph --max-count=16"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

# git-svn aliases
alias gitspull="git svn rebase"
alias gitspush="git svn dcommit"
