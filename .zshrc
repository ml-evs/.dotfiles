# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
ZSH_THEME="bullet-train"
# Default user; displays host if !=
export DEFAULT_USER=matthew
#export KDEWM='/home/matthew/.local/bin/i3'
# Fixes tmux colours
export TERM="xterm-256color"
echo -e -n "\x1b[\x35 q" # changes to blinking bar

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


# Commands to be executed before the prompt is displayed
# # Save current working dir
precmd() { eval "$PROMPT_COMMAND" }
PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
#
# # Change to saved working dir
#[[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"

# Removes horrible backgrounds in ls colouring
export LS_COLORS='fi=0;34:rs=0:di=0;35:ln=01;33:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33:cd=40;33:or=40;31:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=01;34:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.gz=0;35:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.sh=01;35:*.f90=0;34:*.py=0;34:*.cpp=0;35:*.o=0;37:*.mod=0;37:*.pyc=0;37'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export PATH=$PATH:/home/matthew/.local/conda/bin:$PATH
# add locally installed programs and scripts, e.g. latest vim, gcc
#export PATH=$PATH:/opt/bin
#export PATH=$HOME/.local/bin:$HOME/.bin:$HOME/.local/opt/bin:$PATH
# this now moved to .profile

#export PATH=$PATH:$HOME/.local/opt/ase/tools
#export PATH=$HOME/src/matador/bin:$PATH
#export PATH=$HOME/src/matador/scripts:$PATH
export PATH=$HOME/.local/bin:$PATH
#export PATH=$HOME/.local/conda/bin:$PATH
#export PATH=$HOME/.local/opt/Wolfram/bin:$PATH
#export PATH=$PATH:$HOME/.cargo/bin
export XCRYSDEN_TOPDIR="$HOME/.local/opt/xcrysden-1.5.60-bin-semishared"
unset SSH_ASKPASS

export LD_LIBRARY_PATH=/usr/lib

#export F90=ifort
#export F77=ifort
#export CC=icc
#export OMPI_FC=ifort
#export OMPI_CC=icc
#export MPIF90=mpifort
#export MPICC=mpicc
#
export MKLROOT=$HOME/.local/opt/intel/mkl
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

export EDITOR=vim
export GMON_OUT_PREFIX='gprof'
#alias vim="PYTHONPATH=$HOME/src/matador:$PYTHONPATH vim --servername VIM"
#alias pacman="sudo pacman"
alias please="sudo"

source $HOME/.dotfiles/zshrc.global

load_intel() {
    if [ -z "$1" ]; then
        export PATH=$HOME/.local/opt/intel18/bin:$PATH
        export MKLROOT=$HOME/.local/opt/intel18/mkl
    else
        DIRECTORY="${HOME}/.local/opt/intel${1}/bin"
        export CC='gcc'
        export CXX='gcc'
        export FC='ifort'
        export F90='ifort'
        export MPIF90='ifort'
        export MPICC='gcc'
        export OMPI_CC='gcc'
        export OMPI_FC='ifort'
        if [ -d "$DIRECTORY" ]; then
            export PATH="$DIRECTORY:$PATH"
            export MKLROOT="$DIRECTORY/../mkl"
        else
            echo "$DIRECTORY not found... exiting"
        fi
    fi
}

eval $(keychain --eval --quiet ~/.ssh/id_rsa)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/.local/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.local/conda/etc/profile.d/conda.sh" ]; then
        . "$HOME/.local/conda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.local/conda/bin:$PATH"
    fi
fi
unset __conda_setup
conda deactivate
# <<< conda initialize <<<
