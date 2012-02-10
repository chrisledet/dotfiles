# Taken from Zach Holman's dotfiles
# http://github.com/holman/dotfiles

autoload colors && colors

git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

unpushed () {
  /usr/bin/git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo "with %{$fg_bold[magenta]%}unpushed%{$reset_color%}"
  fi
}

ruby_version() {
  ruby -e "puts RUBY_VERSION"
}

ruby_prompt() {
  echo "%{$fg_bold[red]%}ruby v$(ruby_version)%{$reset_color%}"
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\%{$reset_color%}"
}

prompt() {
  echo "\n$(ruby_prompt) in $(directory_name) $(git_dirty)\n$ "
}

export PROMPT="$(prompt)"
export RPROMPT=""
