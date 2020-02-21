# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

alias ta='tmux attach'

ZSH_THEME="bullet-train"

DIRSTACKSIZE=19
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

export EDITOR=vi
export TMUX_TMPDIR=$HOME/.tmux
export TCM_INTEL_VER=17.0.2

export PYTHONPATH=""
export PYTHONPATH="$HOME/src/ajm_group_voronoi_code:$HOME/src/pyairss:$PYTHONPATH"

export PATH=""
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/opt/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/conda/bin"
export PATH="$PATH:$HOME/shared/bin"
export PATH="$PATH:$HOME/shared/bin/aisp_bin"
export PATH="$PATH:/u/fs1/me388/bin/Linux:/u/fs1/me388/bin:/usr/local/bin:/usr/local/shared/bin64:/usr/local/shared/bin:/bin:/usr/bin:/sbin:/usr/sbin"

export LD_LIBRARY_PATH="/rscratch/compilers/mkl/lib:$LD_LIBRARY_PATH"

source $HOME/.dotfiles/zshrc.global
source activate dev2
source $ZSH/oh-my-zsh.sh

vesta() {
    scp $@ nb9:~/tmp > /dev/null 2>&1
    ssh nb9 "cd ~/tmp; VESTA $@" 2&>/dev/null
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
