# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Add cuda to ld library path
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu"
export QT_QPA_PLATFORMTHEME=gtk2
export DOCKER_BUILDKIT=1

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

GPG_TTY=$(tty)

export GPG_TTY
export PINENTRY_USER_DATA="USE_CURSES=1"

export PIPENV_DONT_LOAD_ENV=1
export PATH=$HOME/.local/bin:$PATH

if [[ -z "$PYENV_SHELL" ]];
then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

export ZSH_THEME="bullet-train"
# Default user; displays host if !=
export DEFAULT_USER=mevans
# Fixes tmux colours
export TERM="xterm-256color"
export COLORTERM="truecolor"

keychain -q --nogui --gpg2 --agents gpg,ssh $HOME/.ssh/id_rsa $HOME/.ssh/id_rsa.ceci
source "$HOME/.keychain/$(hostname)-sh"
source "$HOME/.keychain/$(hostname)-sh-gpg"

#BASE16_SHELL_PATH="$HOME/.config/base16-shell"
#[ -n "$PS1" ] && \
#  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
#    source "$BASE16_SHELL_PATH/profile_helper.sh"


# # Save current working dir
precmd() { eval "$PROMPT_COMMAND" }
PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
#
export PYTHONNOUSERSITE=true
unset SSH_ASKPASS


export EDITOR=nvim
export GMON_OUT_PREFIX='gprof'
#alias vim="PYTHONPATH=$HOME/src/matador:$PYTHONPATH vim --servername VIM"
alias v=nvim
alias im=nvim
alias vim=nvim
alias nv=nvim
alias pacman="sudo pacman"
alias please="sudo"
alias tm="tmuxinator"

source $HOME/.dotfiles/zshrc.global

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mevans/.local/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mevans/.local/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/mevans/.local/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mevans/.local/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
autoload -U compinit && compinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/mevans/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/mevans/.local/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/mevans/.local/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/mevans/.local/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/mevans/.local/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<
