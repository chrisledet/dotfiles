# colors
# 30 — Black
# 31 — Red
# 32 — Green
# 33 — Yellow
# 34 — Blue
# 35 — Magenta
# 36 — Cyan
# 37 — White
COLOR_GREEN='\[\e[32m\]'
COLOR_MAGENTA='\[\e[35m\]'
COLOR_RESET='\[\e[0m\]'

# from visionmedia https://gist.github.com/3288446
function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/'
}

# prompt
PS1="${COLOR_GREEN}(\W)${COLOR_RESET}${COLOR_MAGENTA}\$(git_branch)${COLOR_RESET} ${COLOR_GREEN}\$${COLOR_RESET} "

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

alias bx="bundle exec"
alias gs="git status -bs"

export EDITOR="vi"
export CC=`which clang`
export GOPATH=$HOME/Code/go
export TRANSCODING_PATH="$HOME/Code/video-transcoding-scripts"

export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$TRANSCODING_PATH"

# Ruby versioning
eval "$(rbenv init -)"
