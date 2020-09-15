# ~/.bashrc: executed by bash(0) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# default DO NOT DELETE
case $- in
    *i*) ;;
      *) return;;
esac

# set terminal and editor
export TERM=xterm-256color
export VISUAL=vim
export EDITOR="$VISUAL"
force_color_prompt=yes

# basic env varaibles
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\[\033[00m\] \[\033[01;36m\]\W\[\033[00m\] > '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias la='ls -A'
alias docs='cd /mnt/c/Users/ryan4/Documents/'
alias downs='cd /mnt/c/Users/ryan4/Downloads/'
alias code='cd /mnt/c/Code/'
alias notes='cd /mnt/c/Code/GitHub/notes/'
alias terraria="sshpass -p 'serveradmin' ssh terraria@192.168.0.116"
alias minecraft="sshpass -p 'serveradmin' ssh minecraft@192.168.0.116"
alias ipList='echo local: 192.168.0.116 && echo global: 98.245.82.198'
alias exp='explorer.exe'
alias subl='"/mnt/c/Program Files/Sublime Text 3/subl.exe"'
alias sr='source ~/.bashrc'
alias sap='sudo apt update'
alias sag='sudo apt upgrade'
alias sai='sudo apt install'
alias micro='sudo micro'
alias cp='sudo cp'
alias mv='sudo mv'
alias rm='sudo rm'
alias rmdir='sudo rmdir'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

function gui () {
	if [ $1 == "start" ]; then sudo /etc/init.d/xrdp start
	elif [ $1 == "stop" ]; then sudo /etc/init.d/xrdp stop
	else echo command not recognized; fi
}

function sql () {
	if [ $1 == "start" ]; then sudo service postgresql start
	elif [ $1 == "stop" ]; then sudo service postgresql stop
	elif [ $1 == "connect"]; then sudo -u postgres psql
	else echo command not recognized; fi
}