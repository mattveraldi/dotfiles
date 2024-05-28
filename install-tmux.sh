#!/usr/bin/bash

# Install tmux
if ! command -v tmux >/dev/null 2>&1; then
	echo "Installing tmux..."
	sudo apt install tmux -y
fi

# Install tpm
if ! [ -d ~/.tmux/plugins/tpm ]; then
	echo "Cloning tpm..."
	mkdir -p ~/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm tpm
	echo "Creating symlink for tpm..."
	ln -s "$(pwd)/tpm" ~/.tmux/plugins/tpm
fi

# Install .tmux.conf
if ! [ -f ~/.tmux.conf ]; then
	echo "Creating symlink for configs..."
	ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
	tmux source ~/.tmux.conf
fi
