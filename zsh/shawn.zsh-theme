autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

ONLINE='%{%F{green}%}◉'
OFFLINE='%{%F{red}%}⦿'

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
  else
    echo -n "%{$bg%}%{$fg%}"
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

prompt_context() {
  local user=`whoami`

  prompt_segment default yellow "$user"
  prompt_segment default default "@"
  prompt_segment default red "%m"
}

function prompt_online() {
  if [[ -f ~/.offline ]]; then
    echo $OFFLINE
  else
    echo $ONLINE
  fi
}

prompt_dir() {
  prompt_segment default default ' %~'
}

prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment default default "$symbols"
}

function battery_charge {
  if [[ $(sysctl -n hw.model) == *"Book"* ]]
  then
    $ZSH_HOME/bin/battery-status
  fi
}
theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{green}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
    }

    vcs_info
}

build_prompt() {
  RETVAL=$?
  prompt_context
  prompt_end
}

setopt prompt_subst

PROMPT='%B%F{green}${vcs_info_msg_0_}%B%F{magenta}%{$reset_color%}%$(build_prompt)> '
#RPROMPT='$(prompt_online) $(battery_charge) $(prompt_status)'

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

