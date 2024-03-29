#!/bin/sh
#  ___           _        _ _       _
# |_ _|_ __  ___| |_ __ _| | |  ___| |__
#  | || '_ \/ __| __/ _` | | | / __| '_ \
#  | || | | \__ \ || (_| | | |_\__ \ | | |
# |___|_| |_|___/\__\__,_|_|_(_)___/_| |_|
#                 _
#   __ _ _ __ ___| |__
#  / _` | '__/ __| '_ \
# | (_| | | | (__| | | |
#  \__,_|_|  \___|_| |_|
# Install script for new arch machines

# Colors
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\e[0m'

# Welcome
echo "${ORANGE}Welcome!${NC}"
echo "Stay by the machine, there will be some interactive installs"
printf "\n"
echo "${ORANGE}WARNING"
echo "Please ensure you are already a memeber of your SUDOERS group${NC}"
read -r -p "Press any key to continue..." key

# Update mirrors
sudo pacman -Syu

# Dependencies
sudo pacman -S git curl exa make

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

# Paru
printf "\n\n"
echo "${ORANGE}Installing paru AUR helper...${NC}"
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
echo "${GREEN}Complete!${NC}"

# GH Authenticator
printf "\n\n"
echo "${ORANGE}Installing github authenticator and redirecting...${NC}"
sudo pacman -S github-cli
gh auth login
echo "${GREEN}Complete!${NC}"

# OTHER CONFIGS
printf "\n\n"
echo "${ORANGE}Copying configs across system${NC}"
echo "Copying .bashrc"
cp .bashrc ~/.bashrc || echo ERROR: COULD NOT COPY .BASHRC	
echo "Copying .vimrc"
cp .vimrc ~/.vimrc || echo ERROR: COULD NOT COPY .VIMRC
echo "Making ~/.config/ if doesn't exist"
mkdir ~/.config/
echo "Copying alacritty config/colors"
mkdir ~/.config/alacritty/
cp alacritty.yml ~/.config/alacritty/ || echo ERROR: COULD NOT COPY ALACRITTY.YML
cp dracula.yml ~/.config/alacritty/ || echo ERROR: COULD NOT COPY DRACULA.YML
echo "Creating wallpapers directory"
cp -R wallpapers/ ~/Pictures/ || echo ERROR: COULD NOT COPY WALLPAPERS
echo "${GREEN}Complete!${NC}"

# Micro
printf "\n\n"
echo "${ORANGE}Installing micro text editor...${NC}"
sudo pacman -S micro
echo "${GREEN}Complete!${NC}"

# Alacritty
printf "\n\n"
echo "${ORANGE}Installing alacritty terminal...${NC}"
sudo pacman -S alacritty
echo "${GREEN}Complete!${NC}"

# JFETCH
printf "\n\n"
echo "${ORANGE}Installing jfetch sys utility${NC}"
git clone https://github.com/Jimmysit0/jfetch.git
cd jfetch/
sudo make install
cd ..
echo "${GREEN}Complete!${NC}"

# Starship Prompt
printf "\n\n"
echo "${ORANGE}Installing starship prompt${NC}"
curl -sS https://starship.rs/install.sh | sh
cp starship.toml ~/.config/ || echo ERROR: COULD NOT COPY STARSHIP.TOML
echo "${GREEN}Complete!${NC}"

# End
printf "\n\n"
echo "${GREEN}INSTALL COMPLETED!"
echo "Please reload your terminal and everything should be all set!"
read -r -p "Press any key to complete..." key

exit
exit
