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

