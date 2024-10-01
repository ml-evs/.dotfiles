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
#
split () {
    # Create the center virtual monitor (1/2 of the total width)
    xrandr --setmonitor 'DisplayPort-1~1' 3072/896x1440/399+1024+0 DisplayPort-1
    # Create the left virtual monitor (1/4 of the total width)
    xrandr --setmonitor 'DisplayPort-1~2' 1024/448x1440/399+0+0 none
    # Create the right virtual monitor (1/4 of the total width)
    xrandr --setmonitor 'DisplayPort-1~3' 1024/448x1440/399+4096+0 none
    i3-msg restart
}
split4 () {
    # Create the center virtual monitor (1/2 of the total width)
    xrandr --setmonitor 'DisplayPort-1~1' 2560/896x1440/399+1280+0 DisplayPort-1
    # Create the left virtual monitor (1/4 of the total width)
    xrandr --setmonitor 'DisplayPort-1~2' 1280/448x1440/399+0+0 none
    # Create the right virtual monitor (1/4 of the total width)
    xrandr --setmonitor 'DisplayPort-1~3' 1280/448x1440/399+3840+0 none
    i3-msg restart
}

unsplit () {
    xrandr --delmonitor 'DisplayPort-1~1'
    xrandr --delmonitor 'DisplayPort-1~2'
    xrandr --delmonitor 'DisplayPort-1~3'
    autorandr home
    i3-msg restart
    polybar -r ext2 &
}

gwtpr () {
    cd $(git rev-parse --show-toplevel);
    if [ $1 -eq 0 ]; then
        gh pr list
        return
    fi 

    if [[ $1 =~ ^[0-9]+$ ]]; then
        pr_number=$1
        tree="../pr-$pr_number"
        if [ -d $tree ]; then
            cd $tree && gh pr checkout $1
        else
            gh pr view $1
            git worktree add $tree
            cd $tree
            gh pr checkout $1
        fi
    else
        branch_name="ml-evs/$1"
        tree="../$1"
        if [ -d "$tree" ]; then
            cd $tree && git checkout $branch_name
        else
            git worktree add $tree $branch_name
        fi
    fi 

    if [ ! -d "webapp/node_modules" ]; then
        cd webapp; yarn install --dev; cd ../
    fi

    if [ ! -d "pydatalab/.venv" ]; then
        cd pydatalab; uv venv; uv sync --all-extras; cd ../
    fi

    if [ ! -f "pydatalab/.env" ]; then
        cp ../datalab-main/pydatalab/.env pydatalab/.env
    fi

    if [ ! -f "webapp/.env" ]; then
        cp ../datalab-main/webapp/.env webapp/.env
    fi

    if [ "$TERM_PROGRAM" != "tmux" ]; then
        tmuxinator start datalab $(realpath $tree)
    fi
}


workon () {
    # if the activate file does not exist then activate
    if [ $# -eq 0 ]; then
        PYTHON_VER=$DEFAULT_PYTHON_VER
    else
        PYTHON_VER=$1
    fi

    INIT_DIR=$(pwd)

    # find nearest .git folder
    if [ ! -f ".venv/bin/activate" ]; then
        while [ ! -d ".git" ]; do
            cd ..
        done
    fi

    if [ -f "Pipfile" ]; then
        pipenv shell --python $PYTHON_VER
    elif [ -f ".venv/bin/activate" ]; then
        source .venv/bin/activate
    elif [ ! -f ".venv-$PYTHON_VER/bin/activate" ]; then
        echo "Creating virtualenv"
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
