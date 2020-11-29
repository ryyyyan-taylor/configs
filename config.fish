# set terminal and editor
export TERM="xterm-256color"
export VISUAL=micro
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export BAT_PAGER="less -FR --mouse"
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export PSQLRC="~/.psqlrc"
export FISHPATH=/home/ryan/.config/fish/config.fish
set force_color_prompt yes

# basic env varaibles
export HISTCONTROL=ignoredups:erasedups
set HISTSIZE 1000
set HISTFILESIZE 2000


# PROMPT
function fish_prompt
    set_color green
    echo -n "$USER@"
    set_color cyan 
    echo -n " "(basename $PWD)
    set_color white
    echo " > "
end

# GREETING
function fish_greeting
    pfetch
end

## BANG BANG functionality
function __history_previous_command
    switch (commandline -t)
    case "!"
        commandline -t $history[1]; commandline -f repaint
    case "*"
        commandline -i !
    end
end
function __history_previous_command_arguments
    switch (commandline -t)
    case "!"
        commandline -t ""
        commandline -f history-token-search-backward
    case "*"
        commandline -i '$'
    end
end
bind ! __history_previous_command
bind '$' __history_previous_command_arguments




# ALIASES
# most copied over from bashrc

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

# history with custom formatting
alias history='history -R --show-time="%m.%d | %H:%M "'

# for fish, use logout same as exit
alias logout='exit'

# bat : a colorized customizable replacement for cat
alias cat='batcat --theme=base16'
alias bat='batcat'
alias ccat='command cat'

# edit configs on the go
alias emicro='sudo micro ~/.config/micro/settings.json'
alias ebash='sudo micro ~/.bashrc'
alias elacritty='sudo micro /mnt/c/Users/ryan4/AppData/Roaming/alacritty/alacritty.yml'
alias efish='sudo micro ~/.config/fish/config.fish'
alias sr='source ~/.config/fish/config.fish'

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