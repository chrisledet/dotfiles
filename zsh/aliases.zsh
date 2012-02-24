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
alias cleanlogs="sudo rm -rf /private/var/log/asl/*.asl"
