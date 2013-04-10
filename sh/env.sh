export EDITOR="subl -w"
export CC=`which clang`

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.rbenv/bin:$PATH:$HOME/bin"

# rbenv
eval "$(rbenv init -)"
export RUBYLIB=/usr/local/lib/ruby/1.8:/usr/local/lib/ruby/1.8/universal-darwin12.0
