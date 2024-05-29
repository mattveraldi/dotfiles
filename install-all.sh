#!/bin/bash
set -e

sh ./configure-terminal.sh
sh ./install-i3.sh
sh ./install-tmux.sh
sh ./install-nvim.sh
sh ./install-languages.sh
