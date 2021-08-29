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


# GAME SERVER ACCESS
function server
    if test $argv[1] = "connect"
        if test $argv[2] = "rt"
            command ssh rt@192.168.0.248
        end
        if test $argv[2] = "minecraft"
            command ssh -t minecraft@192.168.0.248 'screen -r'
        end
        if test $argv[2] = "terraria"
            command ssh -t terraria@192.168.0.248 'screen -r'
        end
    end

    if test $argv[1] = "start"
        if test $argv[2] = "minecraft"
            command ssh -t @192.168.0.248 'systemctl start minecraft'
        end
        if test $argv[2] = "terraria"
            command ssh -t @192.168.0.248 'systemctl start terraria'
        end
    end

    if test $argv[1] = "stop"
        if test $argv[2] = "minecraft"
            command ssh -t minecraft@192.168.0.248 'screen -S minecraft -X stuff 'stop'$(echo -ne '\015')'
        end
        if test $argv[2] = "terraria"
            command ssh -t terraria@192.168.0.248 'sudo systemctl stop terraria'
        end
    end

    if test $argv[1] = "reset"
        command ssh -t rt@192.168.0.248 '/home/rt/minecraft/reset.sh'
    end
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
    command sudo vim $argv
end
function micro
    command sudo micro $argv
end
function cp
    command sudo cp -i $argv
end
function mv
    command sudo mv -i $argv
end
function rm
    command sudo rm -i $argv
end
function rmdir
    command sudo rmdir -i $argv
end

# batcat: paged and colorized replacement for cat
function cat
    command batcat --theme=base16 $argv
end
function ccat
    command cat $argv
end

# ALIASES
# aliases for things that don't need tab completion
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
alias subl='/mnt/c/Program Files/Sublime Text 3/subl.exe'

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