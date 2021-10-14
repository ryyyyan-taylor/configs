# ~/.bashrc: executed by bash(0) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#   _               _              
#  | |__   __ _ ___| |__  _ __ ___ 
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__ 
#(_)_.__/ \__,_|___/_| |_|_|  \___|
# hosted at 

# default DO NOT DELETE
[[ $- != *i* ]] && return

# TERM and EDITOR
export TERM=xterm-256color
export VISUAL=micro
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export GITUSER="ryyyyan-taylor"
export GITTOKEN="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"
force_color_prompt=yes

# HISTORY
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# SHOPT
shopt -s cdable_vars
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s checkwinsize

# PROMPT
PS1="\n\[\033[1;32m\]\u@\h: \[\033[36m\w\e[1;31m\n: -> \[\033[0m\]"
# PS1='\e[0;32m\u@\e[m \e[0;36m\w\e[m > '


# GAME SERVER ACCESS
# for now only access when home
# setting up guacamole for remote access
server () {

	# connect to running games or user terminal
	if [ $1 == "connect" ]
	then
		if [ $2 == "rt" ]
		then
			ssh rt@192.168.0.248
		fi
		if [ $2 == "minecraft" ]
		then
			ssh -t minecraft@192.168.0.248 'screen -r'
		fi
		if [ $2 == "terraria" ]
		then
			ssh -t terraria@192.168.0.248 'screen -r'
		fi
	fi

	# start servers if not running
	if [ $1 == "start" ]
	then
		if [ $2 == "minecraft" ]
		then
			ssh -t rt@192.168.0.248 'sudo systemctl start minecraft'
		fi
		if [ $2 == "terraria" ]
		then
			ssh -t rt@192.168.0.248 'sudo systemctl start terraria'
		fi
	fi

	# stop servers if running
	if [ $1 == "stop" ]
	then
		if [ $2 == "minecraft" ]
		then
			ssh -t minecraft@192.168.0.248 "screen -S minecraft -X stuff 'stop'$(echo -ne '\015')"
		fi
		if [ $2 == "terraria" ]
		then
			ssh -t terraria@192.168.0.248 "screen -S terraria -X stuff 'exit'$(echo -ne '\015')"
		fi
	fi
	
	# run minecraft reset script
	if [ $1 == "reset" ]
	then
		ssh -t rt@192.168.0.248 '/home/rt/minecraft/reset.sh'
	fi
}

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# ALIASES
# =====================

# Use exa instead of ls or tree
alias ls='exa --group-directories-first -la'
alias lt='exa -T -R -L'

# use bat as cat replacement
alias cat='batcat --theme=OneHalfDark'
alias ccat='cat'

# colorful grep
alias grep='grep --color=auto'

# edit configs easily
alias ebash='micro ~/.bashrc'
alias sr='source ~/.bashrc'
alias emicro='micro ~/.config'
alias elacritty='micro ~/.config/alacritty/alacritty.yml'

# git
alias gitquicksync='git add . && git commit -m "update" && echo $GITTOKEN | xclip -sel clip && git push'

# package management
alias sai='sudo apt install'
alias sap='sudo apt update'
alias sag='sudo apt upgrade'
alias sar='sudo apt remove'
alias saa='sudo apt autoremove'

alias ssi='sudo snap install'
alias ssr='sudo snap remove'

# add sudo and interactive flags
alias micro='sudo micro'
alias cp='sudo cp -i'
alias mv='sudo mv -i'
alias rm='sudo rm -i'
alias rmdir='sudo rmdir'
alias systemctl='sudo systemctl'

# open nautilus in current directory
alias exp='nautilus .'

# loogin to fast campus wifi
alias eduroam='sh ~/Downloads/SecureW2_JoinNow.run'

pfetch
