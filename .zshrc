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

export PATH=/home/matthew/.local/conda/bin:$PATH
# add locally installed programs and scripts, e.g. latest vim, gcc
export PATH=$PATH:/opt/bin
export PATH=$HOME/.local/bin:$HOME/.bin:$HOME/.local/opt/bin:$PATH
#export PATH=$PATH:$HOME/.local/opt/ase/tools
#export PATH=$HOME/src/matador/bin:$PATH
export PATH=$HOME/src/matador/scripts:$PATH
export PATH=$PATH:$HOME/.cargo/bin
export XCRYSDEN_TOPDIR="$HOME/.local/opt/xcrysden-1.5.60-bin-semishared"
unset SSH_ASKPASS

#export F90=ifort
#export F77=ifort
#export CC=icc
#export OMPI_FC=ifort
#export OMPI_CC=icc
#export MPIF90=mpifort
#export MPICC=mpicc

export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# add cuda and atlas to library path
export MKLROOT=/opt/intel/mkl
export LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/impi/2017.3.196/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/X11R6/lib:/usr/X11R6/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib64:/usr/local/lib64
export PYTHONPATH=$HOME/src/pyairss

export STEAM_RUNTIME_PREFER_HOST_LIBRARIES=0



export EDITOR="$HOME/.local/bin/vim -X"
export GMON_OUT_PREFIX='gprof'
alias vim="PYTHONPATH=$HOME/src/matador:$PYTHONPATH vim --servername VIM"

source $HOME/.dotfiles/zshrc.global
