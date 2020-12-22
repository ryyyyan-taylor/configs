# config.fish for the Fish shell. Most of this is simply copied over from my bashrc, so some lines may be irrelevant in fish

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


# BANG BANG functionality
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
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


# actually logout if in tmux
# BROKEN FOR NOW?
function logout
    exit && exit
end



# SIMPLE FUNCTIONS
# fixing tab completion with the way fish handles aliases


# colors and specifics for super common stuff, use exa instead of ls
function ls
    command exa -a --color=always --group-directories-first $argv
end
function lss
    command exa --color=always --group-directories-first $argv
end
function ll
    command exa -la --color=always --group-directories-first $argv
end
function lt
    command tree -C $argv
end
function tree
    command tree -C $argv
end

# run things with sudo, confirm before destructive ones
function vim
    command sudo vim $argv
end
function vi
    command sudo vi $argv
end
function micro
    command sudo micro $argv
end
function cp
    command sudo cp $argv
end
function mv
    command mv -i $argv
end
function rm
    command rm -i $argv
end
function rmdir
    command rmdir -i $argv
end

# batcat: paged and colorized replacement for cat
function cat
    command batcat --theme=base16 $argv
end
function ccat
    command cat $argv
end

# simple git function for personal commit
function push
    git add .
    git commit -a
    git push
end


# ALIASES
# most copied over from bashrc

# navigation shortcuts
alias docs='cd /mnt/c/Users/ryan4/Documents/'
alias downs='cd /mnt/c/Users/ryan4/Downloads/'
alias code='cd /mnt/c/Code/'

# connect to ssh users
alias terraria="sshpass -p 'serveradmin' ssh terraria@192.168.0.116"
alias minecraft="sshpass -p 'serveradmin' ssh minecraft@192.168.0.116"

# launch programs from command line
alias exp='explorer.exe'
alias subl='"/mnt/c/Program Files/Sublime Text 3/subl.exe"'

# history with custom formatting
alias history='history -R --show-time="%m.%d | %H:%M "'

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