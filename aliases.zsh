# # # # # # # # # # # # # # # # # # #
# Shell aliases                     #
# Take from Zach Holman's dotfiles  # 
# github.com/holman/dotfiles        #
# # # # # # # # # # # # # # # # # # #

if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

zle -N newtab

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char

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
