#!/bin/sh

# Install script for new machines

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\e[0m'

echo "${ORANGE}Welcome!"
echo "This script will copy bash configs and install the following programs:"
echo "git, micro, pfetch, htop, rust/cargo, exa, batcat"
echo "Stay by the machine, there will be some interactive installs"
printf "\n"
read -r -p "Press any key to continue..." key
printf '\n\n'

# GIT
echo "${ORANGE}Installing git if not already...${NC}"
sudo apt install git
echo "${GREEN}Complete!${NC}"

# CONFIGS
# echo 'Cloning configs GitHub repo...'
# git clone https://github.com/ryyyyan-taylor/configs

printf "\n\n"
echo "${ORANGE}Would you like to overwrite current .bashrc?${NC}"
read -r key
if [ $key = "y" ]; then
	echo "${ORANGE}Overwriting bashrc...${NC}"
	cp configs/.bashrc ~/.bashrc || echo ERROR: COULD NOT COPY OVER EXISTING BASHRC	
	echo "${GREEN}Complete!${NC}"
else
	echo Continuing...
fi

# MICRO
printf "\n\n"
echo "${ORANGE}Installing micro text editor${NC}"
sudo apt install micro
echo "${GREEN}Complete!${NC}"

# HTOP
printf "\n\n"
echo "${ORANGE}Installing htop{NC}"
sudo apt install htop
echo "${GREEN}Complete!${NC}"

# PFETCH
printf "\n\n"
echo "${ORANGE}Installing pfetch sys utility${NC}"
git clone https://github.com/dylanaraps/pfetch.git
cd pfetch/
sudo make
cd ..
echo "${GREEN}Complete!${NC}"

# RUST
printf "\n\n"
echo "${ORANGE}Beginning rust install, this could take a while${NC}"
sudp apt install cargo
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

printf "\n\n"
echo "${GREEN}INSTALL COMPLETED!"
echo "Reloading bash environment and everything should be set!"
read -r -p "Press any key to complete..." key

source ~/.bashrc
