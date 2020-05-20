#!/bin/bash

function gh () {
	if [ $1 == "push" ]
	then
		cp ~/.vimrc /mnt/c/Code/GitHub/configs
		cp ~/.myCommands.sh /mnt/c/Code/GitHub/configs 
		cp ~/.tmux.conf /mnt/c/Code/GitHub/configs
		cp ~/.bashrc /mnt/c/Code/GitHub/configs 

		cd /mnt/c/Code/GitHub/configs 
		git add .
		git commit -m "update"
		git push https://ryyyyan-taylor:Pjwarrior12.@github.com/ryyyyan-taylor/configs.git --all

		cd /mnt/c/Code/GitHub/notes
		git add .
		git commit -m "update"
		git push https://ryyyyan-taylor:Pjwarrior12.@github.com/ryyyyan-taylor/notes.git --all

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
