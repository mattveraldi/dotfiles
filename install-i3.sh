#!/bin/bash

if ! command -v i3 >/dev/null 2>&1; then
	echo "Installing i3..."
	sudo apt install i3 -y
fi

if ! test -d ~/.config/i3; then
	echo "Creating symlink..."
	ln -s "$(pwd)/i3" ~/.config/i3
fi
