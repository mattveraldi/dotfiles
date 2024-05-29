#!/bin/bash
set -e

if ! type sdk >/dev/null 2>&1; then
	echo "Installing sdkman..."
	curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	sdk install java
fi

if ! type nvm >/dev/null 2>&1; then
	echo "Installing nvm..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
fi

if ! type go >/dev/null 2>&1; then
	echo "Installing golang..."
	wget -O golang.tar.gz https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
	rm -rf /usr/local/go && tar -C /usr/local -xzf golang.tar.gz
fi
