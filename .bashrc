# quit if not interactive
[[ $- != *i* ]] && return

# set terminal and editor
export TERM="xterm-256color"
export VISUAL=micro
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export BAT_PAGER="less -FR --mouse"
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
force_color_prompt=yes

# basic env varaibles
export HISTCONTROL=ignoredups:erasedups
HISTSIZE=1000
HISTFILESIZE=2000

# cool shopt options
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s cdspell
shopt -s dirspell

bind "set completion-ignore-case on"

### PROMPT
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\[\033[00m\] \[\033[01;36m\]\W\[\033[00m\] > '

# Nice ls Colors
LS_COLORS="di=1;36:st=1;36:tw=1;36:ow=1;36"
export LS_COLORS



# ALIASES

# output specifics for often used commands
alias ls='ls --color=always --group-directories-first'
alias la='ls -A --color=always'
alias ll='ls -g --color=always'
alias grep='grep --color=auto'
alias tree='tree -C'

# navigation shortcuts
alias docs='cd /mnt/c/Users/ryan4/Documents/'
alias downs='cd /mnt/c/Users/ryan4/Downloads/'
alias code='cd /mnt/c/Code/'

# connect to ssh users
alias terraria="sshpass -p 'serveradmin' ssh terraria@192.168.0.116"
alias minecraft="sshpass -p 'serveradmin' ssh minecraft@192.168.0.116"

# launch programs from bash
alias exp='explorer.exe'
alias subl='"/mnt/c/Program Files/Sublime Text 3/subl.exe"'

# bat : a colorized customizable replacement for cat
alias cat='batcat --theme=base16'
alias bat='batcat'

# edit configs on the go
alias emicro='sudo micro ~/.config/micro/settings.json'
alias ebash='sudo micro ~/.bashrc'
alias elacritty='sudo micro /mnt/c/Users/ryan4/AppData/Roaming/alacritty/alacritty.yml'
alias sr='source ~/.bashrc'

# apt
alias sap='sudo apt update'
alias sag='sudo apt upgrade'
alias sai='sudo apt install'
alias sar='sudo apt remove'
alias saa='sudo apt autoremove'

# run commands with sudo, confirm before destructive commands
alias micro='sudo micro'
alias screen='sudo screen'
alias cp='sudo cp'
alias mv='sudo mv -i'
alias rm='sudo rm -i'
alias rmdir='sudo rmdir -i'



# FUNCTIONS
function gui () {
	if [ $1 == "start" ]; then sudo /etc/init.d/xrdp start
	elif [ $1 == "stop" ]; then sudo /etc/init.d/xrdp stop
	else echo command not recognized; fi
}

function sql () {
	if [[ $1 == "start" ]]; then sudo service postgresql start
	elif [[ $1 == "stop" ]]; then sudo service postgresql stop
	elif [[ $1 == "connect" ]]; then sudo -u postgres psql
	else echo command not recognized; fi
}

# commands to run on terminal load
pfetch