# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## setup history
export HISTCONTROL=ignoredups:erasedups  
shopt -s histappend
shopt -s checkwinsize
export HISTSIZE=10000
export HISTFILESIZE=10000

MY_TPANE=`echo "$TMUX_PANE" | cut -d '%' -f 2`
if [[ ! -z "$MY_TPANE" ]]; then
  if [[ -d "/home/jhoward/.bash_histdir" ]]; then
    MY_TSESSION=`tmux display-message -p '#S'`
    export HISTFILE="/home/jhoward/.bash_histdir/history.$MY_TSESSION.$MY_TPANE"
    if [[ ! -f "$HISTFILE" ]]; then
      touch "$HISTFILE"
    fi
  fi
else
  MY_TTY=`tty | sed -e "s:/dev/::" | tr "\/" "_"`
  if [[ ! -z "$MY_TTY" ]]; then
    export HISTFILE="/home/jhoward/.bash_histdir/history.$MY_TTY"
    if [[ ! -f "$HISTFILE" ]]; then
      touch "$HISTFILE"
    fi
  fi
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'
    alias ls='ls --color=auto'
    alias vdir='vdir --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias cdgit="cd ~/git"
alias cdnotes="cd ~/notes"
alias findp="find . -path ./.git -prune -o "
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'
alias lsd="ls -d */ | tr \"\n\" \" \""


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
