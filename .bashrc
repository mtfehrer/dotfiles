#Prompt
#Old expression: PS1="\u@\h:\w$ "
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#Vim bindings
set -o vi

#Set ls colors
alias ls="ls --color=auto"

#Fullscreen alias
alias f="wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz"

alias v='vim'

alias c='xclip -sel c'

#Remap Caps-Lock to Esc
setxkbmap -option caps:escape

#Disable Ctrl-s and Ctrl-q
stty -ixon

function p() {
	xreader "$1" 1>/dev/null 2>/dev/null &
}

function ctrl_f() {
    local dir
    IFS=$'\n'
    dir=$(find $HOME -maxdepth 3 -type d | fzf --preview 'tree -C {} | head -200')
    if [ $? -eq 0 ]; then
        if [ -n "$TMUX" ]; then
            cd $dir
        else
            f && tmux new-session -c "$dir"
        fi
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
