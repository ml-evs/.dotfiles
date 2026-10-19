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
    autorandr home
    # Create the center virtual monitor (1/2 of the total width)
    xrandr --setmonitor 'DisplayPort-1~1' 3072/896x1440/399+1024+0 DisplayPort-1
    # Create the left virtual monitor (1/4 of the total width)
    xrandr --setmonitor 'DisplayPort-1~2' 1024/448x1440/399+0+0 none
    # Create the right virtual monitor (1/4 of the total width)
    xrandr --setmonitor 'DisplayPort-1~3' 1024/448x1440/399+4096+0 none
    i3-msg restart
}
split3 () {
    autorandr home
    # Create the center virtual monitor (2120px width)
    xrandr --setmonitor 'DisplayPort-1~1' 2120/896x1440/256+1500+0 DisplayPort-1
    # Create the left virtual monitor (1500px width)
    xrandr --setmonitor 'DisplayPort-1~2' 1500/448x1440/256+0+0 none
    # Create the right virtual monitor (1500px width)
    xrandr --setmonitor 'DisplayPort-1~3' 1500/448x1440/256+3620+0 none
    i3-msg restart
}

unsplit () {
    xrandr --delmonitor 'DisplayPort-1~1'
    xrandr --delmonitor 'DisplayPort-1~2'
    xrandr --delmonitor 'DisplayPort-1~3'
    autorandr laptop
    i3-msg restart
    polybar -r ext2 &
}

# datalab worktrees. `dlwt` (~/.dotfiles/scripts/dlwt) does the work: it puts
# every worktree under <repo>/.worktrees/ and seeds it by reflink-copying
# node_modules and .venv out of the main checkout, so a new tree is ready in
# seconds and costs ~no disk until its files diverge. This wrapper only adds
# what a subprocess can't do: cd, and starting tmuxinator.
#
#   gwtpr            list every worktree, with a verdict on what's safe to bin
#   gwtpr 1234       worktree for PR #1234
#   gwtpr my-thing   worktree on branch ml-evs/my-thing
#
# Cleanup is `dlwt clean` (dry run) then `dlwt clean --yes`.
gwtpr () {
    local target
    cd "$(git rev-parse --show-toplevel)" || return 1

    if [ $# -eq 0 ]; then
        dlwt list
        return
    fi

    if [[ $1 =~ ^[0-9]+$ ]]; then
        target=$(dlwt new "pr-$1" --pr "$1") || return 1
    else
        target=$(dlwt new "$1") || return 1
    fi

    cd "$target" || return 1

    if [ "$TERM_PROGRAM" != "tmux" ]; then
        tmuxinator start datalab "$target"
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

    # If I'm in the base datalab, just cd in
    if [ -d "pydatalab" ]; then
        cd pydatalab
    fi
    # find nearest uv.lock
    if [ ! -f ".venv/bin/activate" ]; then
        counter=0
        while [ ! -d "uv.lock" ]; do
            cd ..
            counter=$((counter + 1))

            if [ $counter -gt 10 ]; then
                echo "No lockfile found"
                cd $INIT_DIR
                return
            fi
        done
    fi

    if [ -f ".venv/bin/activate" ]; then
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
alias bw=rbw

source $HOME/.dotfiles/zshrc.global
#autoload -U compinit && compinit
. "$HOME/.cargo/env"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#. "/home/mevans/.deno/env"

# Run a datalab deployment playbook through ansible-navigator as a single run, e.g.
# `anav` (whole playbook), `anav deploy`, or `anav maintenance deploy` / `anav maintenance,deploy`.
# Navigator settings (colours, artifact/log locations) are in ~/.ansible-navigator.yml
anav() {
    local repo tag valid
    local -a tags
    repo=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "anav: not in a deployment repo" >&2; return 1 }
    # Allow `anav make [tags]` as well as `anav [tags]`
    [[ $1 == make ]] && shift
    # Tags may be space- and/or comma-separated; check them as the deployment Makefiles do
    tags=(${(s:,:)${(j:,:)@}})
    valid=$(grep "tags:" "$repo/ansible/playbook.yml" | sed 's/.*tags://g' | tr -d '[]"' | tr ',' '\n' | tr -d ' ')
    for tag in $tags; do
        grep -qx -- "$tag" <<<"$valid" || { echo "anav: '$tag' is not a valid tag; valid tags: $(sort -u <<<"$valid" | tr '\n' ' ')" >&2; return 1 }
    done
    # Unlock rbw in this terminal first: otherwise .vault-pass.sh triggers pinentry-curses
    # inside navigator's hidden pty, where it can't be answered and spins at 100% CPU on exit
    rbw unlocked >/dev/null 2>&1 || rbw unlock || return 1
    (cd "$repo" && ANAV_REPO=${repo:t} uv run --with ansible-navigator ansible-navigator run ansible/playbook.yml \
        --vault-password-file=./.vault-pass.sh -i ansible/inventory.yml ${tags:+--tags=${(j:,:)tags}})
}
