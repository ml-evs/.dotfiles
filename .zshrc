# Path to your oh-my-zsh installation.
#
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
#export PIPENV_VENV_IN_PROJECT=1
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-execute

export DEFAULT_PYTHON_VER="3.11"

alias 5g='sudo mbimcli -p -d /dev/cdc-wdm0  --quectel-set-radio-state=on'

# Add cuda to ld library path
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu"
#export QT_QPA_PLATFORMTHEME=gtk2
#export DOCKER_BUILDKIT=1
#
workon () {
    # if the activate file does not exist then activate
    if [ $# -eq 0 ]; then
        PYTHON_VER=$DEFAULT_PYTHON_VER
    else
        PYTHON_VER=$1
    fi

    INIT_DIR=$(pwd)

    # find nearest .git folder
    while [ ! -d ".git" ]; do
        cd ..
    done

    if [ -f "Pipfile" ]; then
        pipenv shell --python $PYTHON_VER
    elif [ -f ".venv/bin/activate" ]; then
        source .venv/bin/activate
    elif [ ! -f ".venv-$PYTHON_VER/bin/activate" ]; then
        echo "Creating virtualenv .venv-$PYTHON_VER"
        uv venv
        source .venv/bin/activate
    fi
    if [ -f ".venv-$PYTHON_VER/bin/activate" ]; then
        source .venv-$PYTHON_VER/bin/activate
    fi

    cd $INIT_DIR
}

export RUFF_EXPERIMENTAL_FORMATTER=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

GPG_TTY=$(tty)

export GPG_TTY
export PINENTRY_USER_DATA="USE_CURSES=1"

#if [[ -z "$PYENV_SHELL" ]];
#then
#    export PYENV_ROOT="$HOME/.pyenv"
#    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#    eval "$(pyenv init -)"
#fi
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export ZSH_THEME="bullet-train"
# Default user; displays host if !=
export DEFAULT_USER=mevans
# Fixes tmux colours
export TERM="xterm-256color"
export COLORTERM="truecolor"

#keychain -q --nogui --gpg2 --agents gpg,ssh $HOME/.ssh/id_rsa $HOME/.ssh/id_rsa.ceci
#source "$HOME/.keychain/$(hostname)-sh"
#source "$HOME/.keychain/$(hostname)-sh-gpg"

# # Save current working dir
#precmd() { eval "$PROMPT_COMMAND" }
#PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
#
#export PYTHONNOUSERSITE=true
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

source $HOME/.dotfiles/zshrc.global

#autoload -U compinit && compinit
. "$HOME/.cargo/env"
