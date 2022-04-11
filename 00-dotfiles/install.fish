#!/usr/bin/env fish
set -gx EDITOR vim
set -gx VISUAL $EDITOR
set -gx WEDITOR code

fish_add_path -mgp $DOTFILES_ROOT/bin $HOME/.bin $HOME/.local/bin
set -g fish_key_bindings fish_vi_key_bindings


for f in $DOTFILES_ROOT/*/functions
	set -gp fish_function_path $f
end

for f in $DOTFILES_ROOT/*/conf.d/*.fish
	ln -sf $f ~/.config/fish/conf.d/(basename $f)
end

if test -f ~/.localrc.fish
	ln -sf ~/.localrc.fish ~/.config/fish/conf.d/localrc.fish
end
