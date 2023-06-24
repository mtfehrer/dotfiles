#Prompt
#PS1="\u@\h:\w$ "
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#Vim bindings
set -o vi

#Set ls colors
alias ls="ls --color=auto"

#Fullscreen alias
alias f="wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz"

#Disable Ctrl-s and Ctrl-q
stty -ixon

#Automatically open tmux
#if [ -z "$TMUX" ]; then
#    exec tmux
#fi

function ctrl_f() {
    local dir
    IFS=$'\n'
    dir=$(find $HOME -type d | fzf --preview 'tree -C {} | head -200')
    if [ $? -eq 0 ]; then
        if [ -n "$TMUX" ]; then
            cd $dir
        else
            tmux new-session -c "$dir"
        fi
    fi
}
