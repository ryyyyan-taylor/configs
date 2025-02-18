# config.fish for the Fish shell. Most of this is simply copied over from my bashrc, so some lines may be irrelevant in fish

# set terminal and editor
export TERM="xterm-256color"
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export BAT_PAGER="less -FR --mouse"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PSQLRC="~/.psqlrc"
export FISHPATH=/home/ryan/.config/fish/config.fish

export SPOTIPY_CLIENT_ID="99fa9a8945e640e1a5727e8b1676dc8f"
export SPOTIPY_CLIENT_SECRET="10ec87088df64c8989bd0ce6a84b2cdc"
export SPOTIPY_REDIRECT_URI="http://localhost:8080"
export HISTCONTROL=ignoredups:erasedups



# basic env varaibles
set HISTSIZE 1000
set HISTFILESIZE 2000
set force_color_prompt yes

# PROMPT
function fish_prompt
    set_color green
	echo -e "\n"
    echo -n "$USER @"
    set_color cyan
    echo -n " $PWD"
    set_color brmagenta
    echo -e "\n> "
end


# GREETING
function fish_greeting
    jfetch
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
alias ls='exa -la --color=always --group-directories-first' 
alias lss='exa --color=always --group-directories-first'
alias ll='exa -la --color=always --group-directories-first'
alias lt='tree -C'
alias tree='tree -C'

# run things with sudo, confirm before destructive ones
#alias cp='cp -i'
#alias mv='mv -i'
#alias rm= 'rm -i'
#alias rmdir='rmdir -i'i

# batcat: paged and colorized replacement for cat
alias cat='bat --theme=base16'
alias ccat='cat'

alias history='history -R --show-time="%m.%d | %H:%M "' 

# edit configs on the go
alias emicro='$VISUAL ~/.config/micro/settings.json'
alias ebash='$VISUAL ~/.bashrc'
alias elacritty='$VISUAL /mnt/c/Users/ryan4/AppData/Roaming/alacritty/alacritty.yml'
alias efish='$VISUAL ~/.config/fish/config.fish'
alias sr='source ~/.config/fish/config.fish'

starship init fish | source
