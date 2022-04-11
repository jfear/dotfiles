#!/usr/bin/env fish
test -f ~/.ssh/config || touch ~/.ssh/config

grep -q "Include ~/.ssh/config.dotfiles" ~/.ssh/config ||
	echo "Include ~/.ssh/config.dotfiles" >> ~/.ssh/config
