# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
#ZSH_THEME="amuse"
ZSH_THEME="bullet-train"
# Default user; displays host if !=
export DEFAULT_USER=matthew
#export KDEWM='/home/matthew/.local/bin/i3'
# Fixes tmux colours
export TERM="xterm-256color"

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
export PATH=$PATH:/usr/lib64/mpi/gcc/openmpi/bin
# add CASTEP to path, choosing CASTEP 16.1 for MPI and scripts
export PATH=$HOME/.local/bin:$PATH:$HOME/.bin
#export PATH=$PATH:$HOME/.local/opt/ase/tools
export PATH=$PATH:$HOME/src/CASTEP-8.0/bin/linux_x86_64_gfortran4.8
export PATH=$PATH:$HOME/src/aisp/bin
export PATH=$HOME/src/matador/bin:$PATH
export PATH=$HOME/src/matador/scripts:$PATH
export PATH=$PATH:$HOME/.cargo/bin

export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# add cuda and atlas to library path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib64:/usr/local/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.conda/lib
# set python path to include locally installed packages and CASTEP 7 scripts
#export PYTHONPATH=$PYTHONPATH:$HOME/.local/lib64/python2.7/site-packages
#export PYTHONPATH=$PYTHONPATH:$HOME/.local/lib/python2.7/site-packages
#export PYTHONPATH=$PYTHONPATH:$HOME/.local/opt/ase
export PYTHONPATH=$PYTHONPATH:$HOME/src/pyairss
export CASTEP_COMMAND=castep.mpi
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# User configuration

source $ZSH/oh-my-zsh.sh

plugins=(git z virtualenv)
export EDITOR=vim
export GMON_OUT_PREFIX='gprof'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
 #Example aliases
alias vim="export PYTHONPATH=$HOME/src/matador:$PYTHONPATH; vim"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias grephist="cat ~/.zsh_history | grep"
alias v="vim"
alias i3rc="vim ~/.i3/config"
#alias vesta="$HOME/.local/bin/VESTA"
alias jmol="$HOME/.local/opt/jmol-14.6.0_2016.06.22/jmol.sh"
#alias castep="$HOME/src/CASTEP_16.1/bin/linux_x86_64_gfortran4.9/castep.mpi"
alias lx="ls -X"
alias ca="ca -l "
alias mdv="$HOME/.mdv/mdv.py"
alias nautilus="nautilus --no-desktop"
alias mdit='cat *.md | grep -c "<-- T"'
alias cry='ca -l -r -t'
alias fryan='noglob fryan'
alias zypper='sudo zypper'
alias zyp='sudo zypper'
alias rake='noglob rake'
alias gs='gst'
#alias cleanstep='ls | grep -v *.cell | grep -v *.param | grep -v *.usp | xargs rm'
alias alert_helper='history|tail -n1|sed -e "s/^\s*[0-9]\+\s*//" -e "s/;\s*alert$//"'
alias alert='notify-send "[$?] $(alert_helper)"'

ng () {
    ssh -X -t noggin tmux attach
}

rbusy () {
    ssh -t noggin rbusy $1 $2 $3
}

cavis () {
    ca -l -r -t $1 | awk '{print $1".res"}' | xargs $HOME/.local/bin/VESTA
}

vimtex () {
    gvim -v "$@" --servername VIM
}

DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}
