# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
export QT_QPA_PLATFORMTHEME=gtk2
export DOCKER_BUILDKIT=1
GPG_TTY=$(tty)

export GPG_TTY
export PINENTRY_USER_DATA="USE_CURSES=1"

export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export PIPENV_DONT_LOAD_ENV=1

export ZSH_THEME="bullet-train"
# Default user; displays host if !=
export DEFAULT_USER=mevans
# Fixes tmux colours
export TERM="xterm-256color"
export COLORTERM="truecolor"

keychain -q --nogui --gpg2 --agents gpg,ssh $HOME/.ssh/id_rsa $HOME/.ssh/id_rsa.ceci
source "$HOME/.keychain/$(hostname)-sh"
source "$HOME/.keychain/$(hostname)-sh-gpg"


BASE16_SHELL_PATH="$HOME/.config/base16-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
    source "$BASE16_SHELL_PATH/profile_helper.sh"


# # Save current working dir
precmd() { eval "$PROMPT_COMMAND" }
PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
#
export PYTHONNOUSERSITE=true
unset SSH_ASKPASS

export LD_LIBRARY_PATH=/usr/lib

export EDITOR=vim
export GMON_OUT_PREFIX='gprof'
#alias vim="PYTHONPATH=$HOME/src/matador:$PYTHONPATH vim --servername VIM"
alias v=vim
alias im=vim
alias pacman="sudo pacman"
alias please="sudo"
alias tm="tmuxinator"

source $HOME/.dotfiles/zshrc.global

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mevans/.local/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mevans/.local/conda/etc/profile.d/conda.sh" ]; then
        . "/home/mevans/.local/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/mevans/.local/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
autoload -U compinit && compinit
