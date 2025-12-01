# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

#   _               _
#   | |             | |
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|


#DEFAULT
# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

export VISUAL="nvim"

PS1="\n\[\033[1;32m\]\u@\h: \[\033[36m\w\e[1;31m\n⟼  \[\033[0m\]"

#           _ _
#     /\   | (_)
#    /  \  | |_  __ _ ___  ___  ___
#   / /\ \ | | |/ _` / __|/ _ \/ __|
#  / ____ \| | | (_| \__ \  __/\__ \
# /_/    \_\_|_|\__,_|___/\___||___/

alias vim="nvim"

alias ebash="$VISUAL ~/.bashrc"
alias sr="source ~/.bashrc"

alias ls='eza -lha --group-directories-first --icons=auto'

# use bat as cat replacement
alias cat='bat --theme=OneHalfDark'
alias ccat='command cat'

fastfetch
