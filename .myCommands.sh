#!/bin/bash

function LCompile () {
	pdflatex -synctex=1 $1.tex
	evince $1.pdf
}

function powerMode () {
	sudo tlp start
}

function temps () {
	tlp-stat -t
}

function lsyncConfig () {
	if [ $1 == "push" ]
	then
		cp ~/.vimrc ~/Documents/configs
		cp ~/.myCommands.sh ~/Documents/configs
		cp ~/.tmux.conf ~/Documents/configs
		cp ~/.bashrc ~/Documents/configs

		cd Documents/configs

		git add .
		git commit -m "added files"

		git push https://ryyyyan-taylor:Pjwarrior12.@github.com/ryyyyan-taylor/configs.git --all

		cd
	fi

	if [ $1 == "pull" ]
	then
		cd ~/Documents/configs
		git pull .

		cp .vimrc ~
		cp .myCommands.sh ~
		cp .tmux.conf ~
		cp .bashrc ~

		cd
	fi
}

function wsyncConfig () {
	if [ $1 == "push" ]
	then
		cp ~/.vimrc /mnt/c/Code/GitHub/configs
		cp ~/.myCommands.sh /mnt/c/Code/GitHub/configs 
		cp ~/.tmux.conf /mnt/c/Code/GitHub/configs 

		cd /mnt/c/Code/GitHub/configs 

		git add .
		git commit -m "added files"

		git push https://ryyyyan-taylor:Pjwarrior12.@github.com/ryyyyan-taylor/configs.git --all

		cd 
	fi

	if [ $1 == "pull" ]
	then
		cd /mnt/c/Code/GitHub/configs
		git pull .

		cp .vimrc ~
		cp .myCommands.sh ~
		cp .tmux.conf ~
		cp .bashrc ~

		cd
	fi
}
