#!/bin/bash
set -e

if ! type git >/dev/null 2>&1; then
	echo "Installing git..."
	sudo apt install git -y
fi

if ! type nvim >/dev/null 2>&1; then
	echo "Installing nvim dependencies..."
	sudo apt-get install ninja-build gettext cmake unzip curl build-essential -y
	git clone https://github.com/neovim/neovim
	cd neovim
	git checkout stable
	make CMAKE_BUILD_TYPE=Release
	sudo make install
fi

if ! test -f $HOME/.local/share/fonts/JetBrainsMonoNerdFont-Regular.ttf; then
	echo "Installing nerd font..."
	mkdir -p $HOME/.local/share/fonts
	wget -P $HOME/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
	cd $HOME/.local/share/fonts
	unzip JetBrainsMono.zip
	rm JetBrainsMono.zip
	fc-cache -fv
	echo "Warning: set the Nerd Font manually on your terminal after rebooting."
fi

if ! type lazygit >/dev/null 2>&1; then
	echo "Installing lazygit"
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	rm -f lazygit.tar.gz
	sudo install lazygit /usr/local/bin
fi

if ! type rg >/dev/null 2>&1; then
	echo "Installing ripgrep..."
	sudo apt install ripgrep -y
fi

if ! type fdfind >/dev/null 2>&1; then
	echo "Installing fd..."
	sudo apt install fd-find -y
	cp .bash_aliases $HOME
fi

if ! test -d nvim; then
	echo "Installing LazyVim..."
	git clone https://github.com/LazyVim/starter nvim
	rm -rf nvim/.git
fi

if ! test -d ~/.config/nvim; then
	echo "Creating symlink for configs..."
	ln -s "$(pwd)/nvim" ~/.config/nvim
fi

nvim
