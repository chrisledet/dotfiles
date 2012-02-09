# # # # # # # # # # # # # # # #
# Shell aliases               #
# # # # # # # # # # # # # # # #

# GRC colorizes nifty unix tools all over the place
if $(grc &>/dev/null)
then
  source `brew --prefix`/etc/grc.bashrc
fi

if $(gls &>/dev/null)
then
  alias ls="gls -lF --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

alias sr="screen -r"
alias fcount="ls -1R | wc -l"
alias reloadsh="source ~/.zshrc"

# # # # # # # # # # # # # # # #
# Git aliases                 #
# # # # # # # # # # # # # # # #

# brew install hub
alias git='`which ruby` `which hub`'

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
