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
alias vim="PYTHONPATH=$HOME/src/matador-devel:$PYTHONPATH $HOME/.local/bin/vim -X"

source $HOME/.dotfiles/zshrc.global
