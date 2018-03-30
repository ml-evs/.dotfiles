# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# change theme for login node
if [[ "$HOST" == "cluster2" ]]; then
    ZSH_THEME="bullet-train"
else
    ZSH_THEME="agnoster_host"
fi

DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

# -- Improved X11 forwarding through GNU Screen (or tmux) from http://alexteichman.com/octo/blog/2014/01/01/x11-forwarding-and-terminal-multiplexers/
# If not in screen or tmux, update the DISPLAY cache.
# If we are, update the value of DISPLAY to be that in the cache.
function update-x11-forwarding
{
    if [ -z "$STY" -a -z "$TMUX" ]; then
        echo $DISPLAY > ~/.display.txt
    else
        export DISPLAY=`cat ~/.display.txt`
    fi
}

# This is run before every command.
preexec() {
    # Don't cause a preexec for PROMPT_COMMAND.
    # Beware!  This fails if PROMPT_COMMAND is a string containing more than one command.
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return 

    echo $DISPLAY
    update-x11-forwarding
    echo $DISPLAY

    # Debugging.
    #echo DISPLAY = $DISPLAY, display.txt = `cat ~/.display.txt`, STY = $STY, TMUX = $TMUX  
}
#trap 'preexec' DEBUG

export EDITOR=$HOME/.local/bin/vim

export TCM_INTEL_VER=17.0.2
#export PYTHONPATH="/u/fs1/me388/.local/lib64/python2.7/site-packages
export PYTHONPATH=""
#export PYTHONPATH="$PYTHONPATH:$HOME/matador/src"
#export PYTHONPATH="$HOME/src/matador_doctest/:$PYTHONPATH"
#export PYTHONPATH="$HOME/.local/lib/python3.5/site-packages/spglib-1.9.5-py3.5-linux-x86_64"
export PYTHONPATH="$HOME/src/ajm_group_voronoi_code:$HOME/src/pyairss:$PYTHONPATH"
export PATH=""
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/src/CASTEP-17.2/bin/linux_x86_64_ifort17-TCM/"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/conda/bin"
export PATH="$PATH:$HOME/shared/bin"
export PATH="$PATH:$HOME/shared/bin/aisp_bin"
export PATH="$PATH:/u/fs1/me388/bin/Linux:/u/fs1/me388/bin:/usr/local/bin:/usr/local/shared/bin64:/usr/local/shared/bin:/bin:/usr/bin:/sbin:/usr/sbin"
export PATH="$PATH:$HOME/matador/scripts"
export PATH="$PATH:$HOME/shared/bin/cteprouts"

export LD_LIBRARY_PATH="/rscratch/compilers/mkl/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/shared/intel/composerxe-2015.1.133/mkl/lib/intel64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
# export MANPATH="/usr/local/man:$MANPATH"
#alias vim="PYTHONPATH=$HOME/src/matador-devel:$PYTHONPATH $HOME/.local/bin/vim -X"

source $HOME/.dotfiles/zshrc.global
source activate dev
source $ZSH/oh-my-zsh.sh
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git z virtualenv)
alias vim="PYTHONPATH=$HOME/src/matador-devel:$PYTHONPATH $HOME/.local/bin/vim -X"
alias zshrc="vim -X $HOME/.zshrc"
alias vimrc="vim -X $HOME/.vimrc"
alias mt="~/src/matador-devel/bin/matador"
alias wat="tail -n 50 -f"
alias oj="oddjob"
alias lt="ls -altr"
alias pup="pip install --upgrade ."
lr() {
    if [ -z "$1" ]
    then
        ls | grep \.res$ | wc -l
    else
        ls $1 | grep \.res$ | wc -l
    fi
    return
}
lc() {
    if [ -z "$1" ]
    then
        ls | grep \.cell$ | wc -l
    else
        ls $1 | grep \.cell$ | wc -l
    fi
    return
}
fing() {
    if [ -z "$1" ]
    then
        /usr/bin/finger
    else
        ssh node$1 'finger'
    fi
    return
}
myps() {
    me=$(whoami)
    echo $me
    if [ -z "$1" ]
    then
        ps aux | grep $me | grep -v 'ssh\|ps\|grep'
    else
        ssh node$1 "ps aux | grep $me" | grep -v 'ssh\|ps\|grep'
    fi
    return
}
shame() {
    if [ -z "$1" ]
    then
        ls -d /u/fs1/* | xargs -L 1 -I ! zsh -c '{ find ! -type f \( -name "*.check" -o -name "*.cst_esp" -o -size +1G \) -printf "%s+" 2&>/dev/null; echo 0; } | bc | numfmt --to=si | xargs -I % printf "%\t: !\n"' | sort -h -r
    else
        ls -d /u/fs1/$1 | xargs -L 1 -I ! zsh -c '{ find ! -type f \( -name "*.check" -o -name "*.cst_esp" -o -size +1G \) -printf "%s+" 2&>/dev/null; echo 0; } | bc | numfmt --to=si | xargs -I % printf "%\t: !\n"'
    fi
    return
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
