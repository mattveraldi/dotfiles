#!/bin/bash
set -e

if ! type git >/dev/null 2>&1; then
	echo "Installing git..."
	sudo apt install git -y
fi

if ! test -d ~/.oh-my-bash; then
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

if ! test -f .z; then
	git clone https://github.com/rupa/z.git
fi

if ! test -f ~/.bash_aliases; then
	echo "Creating symlink for bash_aliases..."
	ln -s "$(pwd)/.bash_aliases" $HOME/.bash_aliases
fi
