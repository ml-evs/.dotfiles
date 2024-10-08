# README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).
#
# In addition, I recommend the
# [Tomorrow Night theme](https://github.com/chriskempson/tomorrow-theme) and, if
# you're using it on Mac OS X, [iTerm 2](http://www.iterm2.com/) over
# Terminal.app - it has significantly better color fidelity.

# ------------------------------------------------------------------------------
# CONFIGURATION
# The default configuration, that can be overwrite in your .zshrc file
# ------------------------------------------------------------------------------

VIRTUAL_ENV_DISABLE_PROMPT=true
BULLETTRAIN_TIME_SHOW=false
BULLETTRAIN_CONTEXT_SHOW=true
BULLETTRAIN_CONTEXT_DEFAULT_USER='mevans'
BULLETTRAIN_GIT_EXTENDED=true
BULLETTRAIN_PROMPT_CHAR="\$"
BULLETTRAIN_PROMPT_ROOT=true

# Define order and content of prompt
if [ ! -n "${BULLETTRAIN_PROMPT_ORDER+1}" ]; then
  BULLETTRAIN_PROMPT_ORDER=(
    context
    dir
    virtualenv
    git
    time
    cmd_exec_time
    status
  )
fi

BULLETTRAIN_PROMPT_SEPARATE_LINE=true
BULLETTRAIN_PROMPT_ADD_NEWLINE=false

# STATUS
BULLETTRAIN_STATUS_SHOW=true
BULLETTRAIN_STATUS_EXIT_SHOW=true

BULLETTRAIN_STATUS_BG=black
BULLETTRAIN_STATUS_ERROR_BG=white
BULLETTRAIN_STATUS_FG=red
BULLETTRAIN_TIME_BG=black
BULLETTRAIN_TIME_FG=white

BULLETTRAIN_CUSTOM_MSG=false
BULLETTRAIN_CUSTOM_BG=black
BULLETTRAIN_CUSTOM_FG=default

# VIRTUALENV
BULLETTRAIN_VIRTUALENV_SHOW=true
BULLETTRAIN_VIRTUALENV_BG=16
BULLETTRAIN_VIRTUALENV_FG=black
BULLETTRAIN_VIRTUALENV_PREFIX=

# DIR
if [ ! -n "${BULLETTRAIN_DIR_SHOW+1}" ]; then
  BULLETTRAIN_DIR_SHOW=false
fi
if [ ! -n "${BULLETTRAIN_DIR_BG+1}" ]; then
  BULLETTRAIN_DIR_BG=13
fi
if [ ! -n "${BULLETTRAIN_DIR_FG+1}" ]; then
  BULLETTRAIN_DIR_FG=black
fi
if [ ! -n "${BULLETTRAIN_DIR_CONTEXT_SHOW+1}" ]; then
  BULLETTRAIN_DIR_CONTEXT_SHOW=0
fi
if [ ! -n "${BULLETTRAIN_DIR_EXTENDED+1}" ]; then
  BULLETTRAIN_DIR_EXTENDED=0
fi

# GIT
if [ ! -n "${BULLETTRAIN_GIT_SHOW+1}" ]; then
  BULLETTRAIN_GIT_SHOW=true
fi
if [ ! -n "${BULLETTRAIN_GIT_COLORIZE_DIRTY+1}" ]; then
  BULLETTRAIN_GIT_COLORIZE_DIRTY=true
fi
if [ ! -n "${BULLETTRAIN_GIT_COLORIZE_DIRTY_FG_COLOR+1}" ]; then
  BULLETTRAIN_GIT_COLORIZE_DIRTY_FG_COLOR=red
fi
if [ ! -n "${BULLETTRAIN_GIT_COLORIZE_DIRTY_BG_COLOR+1}" ]; then
  BULLETTRAIN_GIT_COLORIZE_DIRTY_BG_COLOR=black
fi
if [ ! -n "${BULLETTRAIN_GIT_BG+1}" ]; then
  BULLETTRAIN_GIT_BG=black
fi
if [ ! -n "${BULLETTRAIN_GIT_FG+1}" ]; then
  BULLETTRAIN_GIT_FG=green
fi
if [ ! -n "${BULLETTRAIN_GIT_EXTENDED+1}" ]; then
  BULLETTRAIN_GIT_EXTENDED=true
fi
if [ ! -n "${BULLETTRAIN_GIT_PROMPT_CMD+1}" ]; then
  BULLETTRAIN_GIT_PROMPT_CMD="\$(_omz_git_prompt_info)"
fi

# CONTEXT
if [ ! -n "${BULLETTRAIN_CONTEXT_SHOW+1}" ]; then
  BULLETTRAIN_CONTEXT_SHOW=true
fi
if [ ! -n "${BULLETTRAIN_CONTEXT_BG+1}" ]; then
  BULLETTRAIN_CONTEXT_BG=black
fi
if [ ! -n "${BULLETTRAIN_CONTEXT_FG+1}" ]; then
  BULLETTRAIN_CONTEXT_FG=default
fi
if [ ! -n "${BULLETTRAIN_CONTEXT_HOSTNAME+1}" ]; then
  BULLETTRAIN_CONTEXT_HOSTNAME=%m
fi

# GIT PROMPT
if [ ! -n "${BULLETTRAIN_GIT_PREFIX+1}" ]; then
  ZSH_THEME_GIT_PROMPT_PREFIX="\ue0a0 "
else
  ZSH_THEME_GIT_PROMPT_PREFIX=$BULLETTRAIN_GIT_PREFIX
fi
if [ ! -n "${BULLETTRAIN_GIT_SUFFIX+1}" ]; then
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
else
  ZSH_THEME_GIT_PROMPT_SUFFIX=$BULLETTRAIN_GIT_SUFFIX
fi
if [ ! -n "${BULLETTRAIN_GIT_DIRTY+1}" ]; then
  ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✘%F{red}"
else
  ZSH_THEME_GIT_PROMPT_DIRTY=$BULLETTRAIN_GIT_DIRTY
fi
if [ ! -n "${BULLETTRAIN_GIT_CLEAN+1}" ]; then
  ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}✔%F{green}"
else
  ZSH_THEME_GIT_PROMPT_CLEAN=$BULLETTRAIN_GIT_CLEAN
fi
if [ ! -n "${BULLETTRAIN_GIT_ADDED+1}" ]; then
  ZSH_THEME_GIT_PROMPT_ADDED=" %F{yellow}✚%F{yellow}"
else
  ZSH_THEME_GIT_PROMPT_ADDED=$BULLETTRAIN_GIT_ADDED
fi
if [ ! -n "${BULLETTRAIN_GIT_MODIFIED+1}" ]; then
  ZSH_THEME_GIT_PROMPT_MODIFIED=" %F{yellow}✹%F{yellow}"
else
  ZSH_THEME_GIT_PROMPT_MODIFIED=$BULLETTRAIN_GIT_MODIFIED
fi
if [ ! -n "${BULLETTRAIN_GIT_DELETED+1}" ]; then
  ZSH_THEME_GIT_PROMPT_DELETED=" %F{red}✖%F{red}"
else
  ZSH_THEME_GIT_PROMPT_DELETED=$BULLETTRAIN_GIT_DELETED
fi
if [ ! -n "${BULLETTRAIN_GIT_UNTRACKED+1}" ]; then
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{yellow}✭%F{yellow}"
else
  ZSH_THEME_GIT_PROMPT_UNTRACKED=$BULLETTRAIN_GIT_UNTRACKED
fi
if [ ! -n "${BULLETTRAIN_GIT_RENAMED+1}" ]; then
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
else
  ZSH_THEME_GIT_PROMPT_RENAMED=$BULLETTRAIN_GIT_RENAMED
fi
if [ ! -n "${BULLETTRAIN_GIT_UNMERGED+1}" ]; then
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
else
  ZSH_THEME_GIT_PROMPT_UNMERGED=$BULLETTRAIN_GIT_UNMERGED
fi
if [ ! -n "${BULLETTRAIN_GIT_AHEAD+1}" ]; then
  ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
else
  ZSH_THEME_GIT_PROMPT_AHEAD=$BULLETTRAIN_GIT_AHEAD
fi
if [ ! -n "${BULLETTRAIN_GIT_BEHIND+1}" ]; then
  ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
else
  ZSH_THEME_GIT_PROMPT_BEHIND=$BULLETTRAIN_GIT_BEHIND
fi
if [ ! -n "${BULLETTRAIN_GIT_DIVERGED+1}" ]; then
  ZSH_THEME_GIT_PROMPT_DIVERGED=" ⬍"
else
  ZSH_THEME_GIT_PROMPT_DIVERGED=$BULLETTRAIN_GIT_PROMPT_DIVERGED
fi

# COMMAND EXECUTION TIME
if [ ! -n "${BULLETTRAIN_EXEC_TIME_SHOW+1}" ]; then
  BULLETTRAIN_EXEC_TIME_SHOW=true
fi
if [ ! -n "${BULLETTRAIN_EXEC_TIME_ELAPSED+1}" ]; then
  BULLETTRAIN_EXEC_TIME_ELAPSED=5
fi
if [ ! -n "${BULLETTRAIN_EXEC_TIME_BG+1}" ]; then
  BULLETTRAIN_EXEC_TIME_BG=black
fi
if [ ! -n "${BULLETTRAIN_EXEC_TIME_FG+1}" ]; then
  BULLETTRAIN_EXEC_TIME_FG=cyan
fi


# ------------------------------------------------------------------------------
# SEGMENT DRAWING
# A few functions to make it easy and re-usable to draw segmented prompts
# ------------------------------------------------------------------------------

#CURRENT_BG='NONE'
CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

# ------------------------------------------------------------------------------
# PROMPT COMPONENTS
# Each component will draw itself, and hide itself if no information needs
# to be shown
# ------------------------------------------------------------------------------

# Context: user@hostname (who am I and where am I)
context() {
  local user="$(whoami)"
  [[ "$user" != "$BULLETTRAIN_CONTEXT_DEFAULT_USER" || -n "$BULLETTRAIN_IS_SSH_CLIENT" ]] && echo -n "${user}@$BULLETTRAIN_CONTEXT_HOSTNAME"
}
prompt_context() {
  [[ $BULLETTRAIN_CONTEXT_SHOW == false ]] && return

  local _context="$(context)"
  [[ -n "$_context" ]] && prompt_segment $BULLETTRAIN_CONTEXT_BG $BULLETTRAIN_CONTEXT_FG "$_context"
}

# Based on http://stackoverflow.com/a/32164707/3859566
function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd' $D
  [[ $H > 0 ]] && printf '%dh' $H
  [[ $M > 0 ]] && printf '%dm' $M
  printf '%ds' $S
}

# Prompt previous command execution time
preexec() {
  cmd_timestamp=`date +%s`
}

precmd() {
  [[ $BULLETTRAIN_EXEC_TIME_SHOW == false ]] && return

  local stop=`date +%s`
  local start=${cmd_timestamp:-$stop}
  let BULLETTRAIN_last_exec_duration=$stop-$start
  cmd_timestamp=''
}

prompt_cmd_exec_time() {
  [[ $BULLETTRAIN_EXEC_TIME_SHOW == false ]] && return

  [ $BULLETTRAIN_last_exec_duration -gt $BULLETTRAIN_EXEC_TIME_ELAPSED ] && prompt_segment $BULLETTRAIN_EXEC_TIME_BG $BULLETTRAIN_EXEC_TIME_FG "⌛ $(displaytime $BULLETTRAIN_last_exec_duration)"
}

# Custom
prompt_custom() {
  if [[ $BULLETTRAIN_CUSTOM_MSG == false ]]; then
    return
  fi

  prompt_segment $BULLETTRAIN_CUSTOM_BG $BULLETTRAIN_CUSTOM_FG "${BULLETTRAIN_CUSTOM_MSG}"
}

# Git
prompt_git() {
  if [[ $BULLETTRAIN_GIT_SHOW == false ]]; then
    return
  fi

  local ref dirty mode repo_path git_prompt
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    if [[ $BULLETTRAIN_GIT_COLORIZE_DIRTY == true && -n $(git status --porcelain --ignore-submodules) ]]; then
      BULLETTRAIN_GIT_BG=$BULLETTRAIN_GIT_COLORIZE_DIRTY_BG_COLOR
      BULLETTRAIN_GIT_FG=$BULLETTRAIN_GIT_COLORIZE_DIRTY_FG_COLOR
    fi
    #prompt_segment $BULLETTRAIN_GIT_BG $BULLETTRAIN_GIT_FG
    prompt_segment black white

    # show current git repo name:

    eval git_prompt=${BULLETTRAIN_GIT_PROMPT_CMD}
    if [[ $BULLETTRAIN_GIT_EXTENDED == true ]]; then
      remote=$(git config --get remote.origin.url)
      github=$(echo $remote | grep -Eo 'github.com[:/][^/]+/[^/]+')
      repo=$(echo $remote | awk '{split($0, a, ":"); print a[2]}')
      if [[ -n $github ]]; then
        repo="\uea84  ${repo}"
      fi
      echo -n ${repo}
      prompt_segment $BULLETTRAIN_GIT_BG $BULLETTRAIN_GIT_FG
      echo -n ${git_prompt}$(git_prompt_status)
    else
      prompt_segment $BULLETTRAIN_GIT_BG $BULLETTRAIN_GIT_FG
      echo -n ${git_prompt}
    fi
  fi
}

# Dir: current working directory
prompt_dir() {
  if [[ $BULLETTRAIN_DIR_SHOW == false ]]; then
    return
  fi

  local dir=''
  local _context="$(context)"
  [[ $BULLETTRAIN_DIR_CONTEXT_SHOW == true && -n "$_context" ]] && dir="${dir}${_context}:"

  if [[ $BULLETTRAIN_DIR_EXTENDED == 0 ]]; then
    #short directories
    dir="${dir}%1~"
  elif [[ $BULLETTRAIN_DIR_EXTENDED == 2 ]]; then
    #long directories
    dir="${dir}%0~"
  else
    #medium directories (default case)
    dir="${dir}%4(c:...:)%3c"
  fi

  prompt_segment $BULLETTRAIN_DIR_FG $BULLETTRAIN_DIR_BG $dir
}

# from pull_request by niechen
prompt_virtualenv() {
  if [[ -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    local virtualenv_path="$VIRTUAL_ENV"
    if [[ -n $virtualenv_path ]]; then
      prompt_segment $BULLETTRAIN_VIRTUALENV_FG $BULLETTRAIN_VIRTUALENV_BG $BULLETTRAIN_VIRTUALENV_PREFIX" $(basename $virtualenv_path)"
    elif [[ -n $PIPENV_ACTIVE ]]; then
      prompt_segment $BULLETTRAIN_VIRTUALENV_FG $BULLETTRAIN_VIRTUALENV_BG $BULLETTRAIN_VIRTUALENV_PREFIX" $(which python | awk '{split($0, a, "/"); print a[7]}')"
    elif [[ -n $CONDA_DEFAULT_ENV ]]; then
PIPENV_COMMAND = which python | awk '{split($0, a, "/"); print a[7]}'
      prompt_segment $BULLETTRAIN_VIRTUALENV_FG $BULLETTRAIN_VIRTUALENV_BG $BULLETTRAIN_VIRTUALENV_PREFIX" $CONDA_DEFAULT_ENV"
    elif [[ -n $PYENV_VERSION ]]; then
      prompt_segment $BULLETTRAIN_VIRTUALENV_FG $BULLETTRAIN_VIRTUALENV_BG $BULLETTRAIN_VIRTUALENV_PREFIX" $PYENV_VERSION"
    #elif which pyenv &> /dev/null; then
    #  prompt_segment $BULLETTRAIN_VIRTUALENV_BG $BULLETTRAIN_VIRTUALENV_FG $BULLETTRAIN_VIRTUALENV_PREFIX" $(pyenv version | sed -e 's/ (set.*$//' | tr '\n' ' ' | sed 's/.$//')"
    fi
  fi
}

# Virtualenv: current working virtualenv
#prompt_virtualenv_old() {
#  if [[ $BULLETTRAIN_VIRTUALENV_SHOW == false ]]; then
#    return
#  fi

#  local virtualenv_path="$VIRTUAL_ENV"
#  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
#    prompt_segment $BULLETTRAIN_VIRTUALENV_BG $BULLETTRAIN_VIRTUALENV_FG $BULLETTRAIN_VIRTUALENV_PREFIX" $(basename $virtualenv_path)"
#  elif which pyenv &> /dev/null; then
#    prompt_segment $BULLETTRAIN_VIRTUALENV_BG $BULLETTRAIN_VIRTUALENV_FG $BULLETTRAIN_VIRTUALENV_PREFIX" $(pyenv version | sed -e 's/ (set.*$//' | tr '\n' ' ' | sed 's/.$//')"
#  fi
#}

# NVM: Node version manager
prompt_nvm() {
  if [[ $BULLETTRAIN_NVM_SHOW == false ]]; then
    return
  fi

  local nvm_prompt
  if type nvm >/dev/null 2>&1; then
    nvm_prompt=$(nvm current 2>/dev/null)
    [[ "${nvm_prompt}x" == "x" ]] && return
  else
    nvm_prompt="$(node --version)"
  fi
  nvm_prompt=${nvm_prompt}
  prompt_segment $BULLETTRAIN_NVM_BG $BULLETTRAIN_NVM_FG $BULLETTRAIN_NVM_PREFIX$nvm_prompt
}

prompt_time() {
  if [[ $BULLETTRAIN_TIME_SHOW == false ]]; then
    return
  fi

  if [[ $BULLETTRAIN_TIME_12HR == true ]]; then
    prompt_segment $BULLETTRAIN_TIME_BG $BULLETTRAIN_TIME_FG %D{%r}
  else
    prompt_segment $BULLETTRAIN_TIME_BG $BULLETTRAIN_TIME_FG %D{%T}
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  if [[ $BULLETTRAIN_STATUS_SHOW == false ]]; then
    return
  fi

  local symbols
  symbols=()
  [[ $RETVAL -ne 0 && $BULLETTRAIN_STATUS_EXIT_SHOW != true ]] && symbols+="✘"
  [[ $RETVAL -ne 0 && $BULLETTRAIN_STATUS_EXIT_SHOW == true ]] && symbols+="✘ $RETVAL"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡%f"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="⚙"

  if [[ -n "$symbols" && $RETVAL -ne 0 ]]; then
    prompt_segment $BULLETTRAIN_STATUS_ERROR_FG $BULLETTRAIN_STATUS_BG "$symbols"
  elif [[ -n "$symbols" ]]; then
    prompt_segment $BULLETTRAIN_STATUS_FG $BULLETTRAIN_STATUS_BG "$symbols"
  fi

}

# Prompt Character
prompt_char() {
  local bt_prompt_char
  bt_prompt_char=""

  if [[ ${#BULLETTRAIN_PROMPT_CHAR} -eq 1 ]]; then
    bt_prompt_char="${BULLETTRAIN_PROMPT_CHAR}"
  fi

  if [[ $BULLETTRAIN_PROMPT_ROOT == true ]]; then
    bt_prompt_char="%(!.%F{red}#.%F{green}${bt_prompt_char}%f)"
  fi

  if [[ $BULLETTRAIN_PROMPT_SEPARATE_LINE == false ]]; then
    bt_prompt_char="${bt_prompt_char}"
  fi

  echo -n $bt_prompt_char
}

# Prompt Line Separator
prompt_line_sep() {
  if [[ $BULLETTRAIN_PROMPT_SEPARATE_LINE == true ]]; then
    # newline wont print without a non newline character, so add a zero-width space
    echo -e '\n%{\u200B%}'
  fi
}

# ------------------------------------------------------------------------------
# MAIN
# Entry point
# ------------------------------------------------------------------------------

build_prompt() {
  RETVAL=$?
  for segment in $BULLETTRAIN_PROMPT_ORDER
  do
    prompt_$segment
  done
  prompt_end
}

NEWLINE='
'
PROMPT=''
[[ $BULLETTRAIN_PROMPT_ADD_NEWLINE == true ]] && PROMPT="$PROMPT$NEWLINE"
PROMPT="$PROMPT"'%{%f%b%k%}$(build_prompt)'
[[ $BULLETTRAIN_PROMPT_SEPARATE_LINE == true ]] && PROMPT="$PROMPT$NEWLINE"
PROMPT="$PROMPT"'%{${fg_bold[default]}%}'
[[ $BULLETTRAIN_PROMPT_SEPARATE_LINE == false ]] && PROMPT="$PROMPT "
PROMPT="$PROMPT"'$(prompt_char) %{$reset_color%}'
