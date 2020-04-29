#!/bin/bash

function LCompile () {
	pdflatex -synctex=1 $1.tex
	evince $1.pdf
}

function Python () {
	cd /mnt/Windows/Code/Personal/Python/
}

function Personal () {
	cd /mnt/Windows/Code/Personal/
}

function Code () {
	cd /mnt/Windows/Code/
}

function powerMode () {
	sudo tlp start
}

function temps () {
	tlp-stat -t
}

function LpushConfig () {
	cp ~/.vimrc ~/Documents/configs
	cp ~/.myCommands.sh ~/Documents/configs
	cp ~/.tmux.conf ~/Documents/configs

	cd Documents/configs

	git add .
	git commit -m "added files"

	git push https://ryyyyan-taylor:Pjwarrior12.@github.com/ryyyyan-taylor/configs.git --all

	cd ~
}

function WpushConfig () {
	cp ~/.vimrc /mnt/c/Code/GitHub/configs
	cp ~/.myCommands.sh /mnt/c/Code/GitHub/configs 
	cp ~/.tmux.conf /mnt/c/Code/GitHub/configs 

	cd /mnt/c/Code/GitHub/configs 

	git add .
	git commit -m "added files"

	git push https://ryyyyan-taylor:Pjwarrior12.@github.com/ryyyyan-taylor/configs.git --all

	cd 
}
