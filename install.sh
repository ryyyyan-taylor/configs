#!/bin/sh
#  ___           _        _ _       _
# |_ _|_ __  ___| |_ __ _| | |  ___| |__
#  | || '_ \/ __| __/ _` | | | / __| '_ \
#  | || | | \__ \ || (_| | | |_\__ \ | | |
# |___|_| |_|___/\__\__,_|_|_(_)___/_| |_|
# 
# Install script for new machines

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\e[0m'

echo "${ORANGE}Welcome!"
echo "This script will copy bash configs and install the following programs:"
echo "git, micro, vim, pfetch, htop, figlet, rust/cargo, exa, batcat"
echo "Stay by the machine, there will be some interactive installs"
printf "\n"
read -r -p "Press any key to continue..." key

printf "\n\n"
echo "${ORANGE}Checking current directory..."
if [ $(pwd | grep configs | wc -l) = 0 ]; then
	echo ERROR: not working within configs directory
	exit
fi

# UPDATE APT
printf '\n\n'
echo "${ORANGE}Updating and upgrading apt databases${NC}"
sudo apt update -y && sudo apt upgrade -y
echo "${GREEN}Complete!${NC}"

# COPY BASHRC FROM REMOTE
printf "\n\n"
echo "${ORANGE}Would you like to overwrite current .bashrc (y)?${NC}"
read -r key
if [ $key = "y" ]; then
	echo "${ORANGE}Overwriting bashrc...${NC}"
	cp .bashrc ~/.bashrc || echo ERROR: COULD NOT COPY OVER EXISTING BASHRC	
	echo "${GREEN}Complete!${NC}"
else
	echo Continuing...
fi

# MICRO
printf "\n\n"
echo "${ORANGE}Installing micro text editor${NC}"
sudo apt install micro -y
echo "${GREEN}Complete!${NC}"

# VIM
printf "\n\n"
echo "${ORANGE}Installing vim as backup text editor{NC}"
sudo apt install vim -y
cp .vimrc ~/.vimrc
echo "${GREEN}Complete!${NC}"

# PFETCH
printf "\n\n"
echo "${ORANGE}Installing pfetch sys utility${NC}"
git clone https://github.com/dylanaraps/pfetch.git
cd pfetch/
sudo make install
cd ..
echo "${GREEN}Complete!${NC}"

# MISC
printf "\n\n"
echo "${ORANGE}Installing misc smaller utilities{NC}"
sudo apt install htop -y
sudo apt install figlet -y
echo "${GREEN}Complete!${NC}"

# RUST CONFIRM
printf "\n\n"
echo "${ORANGE}Would you like to take the time to install Rust and the Cargo package manager?"
echo "Do know, some aliases in .bashrc will not work without Rust utilities."
read -r -p "Would you like to continue? (y/n): " key

if [ $key = "y" ]; then

	# RUST
	printf "\n\n"
	echo "${ORANGE}Beginning rust install, this could take a while${NC}"
	sudp apt install cargo -y
	echo "${GREEN}Complete!${NC}"

	# RUST PROGRAMS
	printf "\n\n"
	echo "${ORANGE}Installing exa${NC}"
	sudo cargo install exa
	echo "${GREEN}Complete!${NC}"

	printf "\n\n"
	echo "${ORANGE}Installing batcat${NC}"
	sudo cargo install batcat
	echo "${GREEN}Complete!${NC}"

else
	echo Skipping Rust install...
fi

printf "\n\n"
echo "${GREEN}INSTALL COMPLETED!"
echo "Reloading bash environment and everything should be set!"
read -r -p "Press any key to complete..." key

source ~/.bashrc
exit
