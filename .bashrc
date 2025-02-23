#
#  | |__   __ _ ___| |__  _ __ ___ 
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__ 
#(_)_.__/ \__,_|___/_| |_|_|  \___|
#
# hosted at https://github.com/ryyyyan-taylor/configs
# visit me at https://ryantaylor.tech

# default DO NOT DELETE
[[ $- != *i* ]] && return

# TERM and EDITOR
export TERM=xterm-256color
export VISUAL=micro
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export GITUSER="ryyyyan-taylor"
export MICRO_TRUECOLOR=1
export SPICETIFY_INSTALL="/home/rt/spicetify-cli"
export STARSHIP_CONFIG="/home/rt/.config/starship.toml"

export SPOTIPY_CLIENT_ID="99fa9a8945e640e1a5727e8b1676dc8f"
export SPOTIPY_CLIENT_SECRET="10ec87088df64c8989bd0ce6a84b2cdc"
export SPOTIPY_REDIRECT_URI="http://localhost:8080"

# PATH and PERL PATH
export PATH="/home/rt/.local/bin:$SPICETIFY_INSTALL:/home/rt/.cargo/bin:$PATH"

PATH="/home/rt/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/rt/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/rt/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/rt/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/rt/perl5"; export PERL_MM_OPT;

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
force_color_prompt=yes

# PROMPT / WINDOW TITLE
# PS1="\n\[\033[1;32m\]\u@\h: \[\033[36m\w\e[1;31m\n⟼  \[\033[0m\]"
eval "$(starship init bash)"
# PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
# Old Prompt :  PS1='\e[0;32m\u@\e[m \e[0;36m\w\e[m > '


# found from DistroTube on Youtube
# extract all sorts of different filetypes
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



#     _    _ _
#    / \  | (_) __ _ ___  ___  ___
#   / _ \ | | |/ _` / __|/ _ \/ __|
#  / ___ \| | | (_| \__ \  __/\__ \
# /_/   \_\_|_|\__,_|___/\___||___/


# Use exa instead of ls or tree
alias ls='exa --group-directories-first -la'
alias lt='exa -T -R -L'

# use bat as cat replacement
alias cat='bat --theme=OneHalfDark'
alias ccat='cat'

# colorful grep
alias grep='grep --color=auto'

# edit configs easily
alias ebash='micro ~/.bashrc'
alias sr='source ~/.bashrc'
alias emicro='micro ~/.config/micro/'
alias elacritty='micro ~/.config/alacritty/alacritty.yml'

# git
alias gitquicksync='git add . && git commit -e && token && git push'
alias token='cat ~/.token.gpg | gpg | xclip -sel clip'

# apt shortcuts
alias sai='sudo apt install'
alias sap='sudo apt update'
alias sag='sudo apt upgrade'
alias sar='sudo apt remove'
alias saa='sudo apt autoremove'

# add sudo and interactive flags
alias micro='sudo micro'
alias cp='sudo cp -i'
alias mv='sudo mv -i'
alias rm='sudo rm -i'
alias rmdir='sudo rmdir'
alias systemctl='sudo systemctl'

# open file manager in current directory
alias exp='dolphin .'

# python -> python3
alias python='python3'
alias pip='pip3'


# Run at startup
jfetch

# Created by `pipx` on 2023-06-29 19:41:07
export PATH="$PATH:/home/rt/.local/bin"
