# Path to your oh-my-zsh installation.
export ZSH=/u/fs1/me388/.oh-my-zsh
# change theme for login node
if [[ "$HOST" == "cluster2" ]]; then
    ZSH_THEME="bullet-train"
else
    ZSH_THEME="agnoster_host"
fi
#export PYTHONPATH="/u/fs1/me388/.local/lib64/python2.7/site-packages
export PYTHONPATH=""
#export PYTHONPATH="$PYTHONPATH:$HOME/matador/src"
#export PYTHONPATH="$HOME/src/matador_doctest/:$PYTHONPATH"
#export PYTHONPATH="$HOME/.local/lib/python3.5/site-packages/spglib-1.9.5-py3.5-linux-x86_64"
export PYTHONPATH="$HOME/src/ajm_group_voronoi_code:$PYTHONPATH"
export PATH=""
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/conda/bin"
export PATH="$PATH:$HOME/shared/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/shared/bin/aisp_bin"
export PATH="$PATH:$HOME/matador/bin"
export PATH="$PATH:$HOME/crysdb-bacon/bin"
export PATH="$PATH:$HOME/matador_testing/bin"
export PATH="$PATH:/u/fs1/me388/bin/Linux:/u/fs1/me388/bin:/usr/local/bin:/usr/local/shared/bin64:/usr/local/shared/bin:/bin:/usr/bin:/sbin:/usr/sbin"
export PATH="$PATH:$HOME/matador/scripts"
export PATH="$PATH:$HOME/shared/bin/cteprouts"
export LD_LIBRARY_PATH="/rscratch/compilers/mkl/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/shared/intel/composerxe-2015.1.133/mkl/lib/intel64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git z)
export CASTEP_COMMAND="$HOME/CASTEPY/bin/linux_x86_64_gfortran4.8/castep.serial"
alias vim="PYTHONPATH=$HOME/src/matador-devel:$PYTHONPATH vim"
alias zshrc="vim $HOME/.zshrc"
alias mt="~/src/matador-devel/bin/matador"
alias wat="tail -n 50 -f"
alias oj="oddjob"
alias pup="pip install --upgrade ."
lr() {
    if [ -z "$1" ]
    then
        ls | grep res | wc -l
    else
        ls $1 | grep res | wc -l
    fi
    return
}
fing() {
    if [ -z "$1" ]
    then
        ssh $1 'finger'
    else
        /usr/bin/finger
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
