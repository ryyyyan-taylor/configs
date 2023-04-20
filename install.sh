#!/bin/sh
#  ___           _        _ _       _
# |_ _|_ __  ___| |_ __ _| | |  ___| |__
#  | || '_ \/ __| __/ _` | | | / __| '_ \
#  | || | | \__ \ || (_| | | |_\__ \ | | |
# |___|_| |_|___/\__\__,_|_|_(_)___/_| |_|
# 
# Install script for new machines

# Colors
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\e[0m'

# Welcome
echo "${ORANGE}Welcome!${NC}"
echo "Stay by the machine, there will be some interactive installs"
printf "\n"
echo "${ORANGE}WARNING"
echo "Please update repositories prior to running this script (apt, aur, pacman, etc)${NC}"
printf "\n"
read -r -p "Press any key to continue..." key

# Dependencies
printf "\n\n"
echo "${ORANGE}DEPENDENCIES:${NC}"
echo "Curl, Git, Exa, make"
echo "Please ensure these are installed prior to continuing"
read -r -p "Press any key to continue..." key

# Check user and directory
printf "\n\n"
echo "${ORANGE}Checking current user"
if [ $EUID = 0 ]; then
	echo ERROR: Do not run script as root
	exit
fi
echo "${ORANGE}Checking current directory"
if [ $(pwd | grep configs | wc -l) = 0 ]; then
	echo ERROR: not working within configs directory
	exit
fi

# GH Authenticator
printf "\n\n"
echo "${ORANGE}Installing github authenticator and redirecting...${NC}"
echo "Which package would you like to install?"
echo "${ORANGE}(1)${NC} Debian, Ubuntu, etc (via apt)"
echo "${ORANGE}(2)${NC} Arch (via pacman)"
read -r key
if [ $key = "1" ]; then
	type -p curl >/dev/null || sudo apt install curl -y
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
	&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
	gh auth login
elif [ $key = "2" ]; then
	sudo pacman -S github-cli
	gh auth login

else
	echo Skipping github install...
fi

# OTHER CONFIGS
printf "\n\n"
echo "${ORANGE}Copying configs across system${NC}"
cp .bashrc ~/.bashrc || echo ERROR: COULD NOT COPY .BASHRC	
cp .vimrc ~/.vimrc || echo ERROR: COULD NOT COPY .VIMRC
mkdir ~/.config/alacritty/
cp alacritty.yml ~/.config/alacritty/ || echo ERROR: COULD NOT COPY ALACRITTY.YML
cp dracula.yml ~/.config/alacritty/ || echo ERROR: COULD NOT COPY DRACULA.YML
echo "${GREEN}Complete!${NC}"

# JFETCH
printf "\n\n"
echo "${ORANGE}Installing jfetch sys utility${NC}"
git clone https://github.com/dylanaraps/pfetch.git
cd pfetch/
sudo make install
cd ..
echo "${GREEN}Complete!${NC}"

# Starship Prompt
printf "\n\n"
echo "${ORANGE}Installing starship prompt${NC}"
curl -sS https://starship.rs/install.sh | sh
cp starship.toml ~/.config/ || echo ERROR: COULD NOT COPY STARSHIP.TOML
echo "${GREEN}Complete!${NC}"

printf "\n\n"
echo "${GREEN}INSTALL COMPLETED!"
echo "Reloading bash environment and everything should be set!"
read -r -p "Press any key to complete..." key

source ~/.bashrc
exit
