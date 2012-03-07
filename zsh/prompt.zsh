# Taken from Zach Holman's dotfiles
# http://github.com/holman/dotfiles

autoload colors && colors

git_branch() {
  echo $(/usr/local/bin/hub symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
  # echo $(gs | xargs | awk '{ print $2 }')
}

git_dirty() {
  st=$(/usr/local/bin/hub status 2>/dev/null | tail -n 1)
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
 ref=$(/usr/local/bin/hub symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

unpushed () {
  /usr/local/bin/hub cherry -v origin/$(git_branch) 2>/dev/null
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
  # ruby -v | awk '{ print $2 }'
  ruby -e "print RUBY_VERSION"
}

ruby_prompt() {
  echo "%{$fg_bold[red]%}ruby v$(ruby_version)%{$reset_color%}"
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\%{$reset_color%}"
}

prompt() {
  # if [[ $git_dirty == "" ]]
  # then
    echo "($(ruby_prompt) in $(directory_name))\$ "
  # else
    # echo "($(ruby_prompt) in $(directory_name) $(git_ditry)) \$ "
  # fi
}

export PROMPT="$(prompt)"
export RPROMPT=""
