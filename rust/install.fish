#!/usr/bin/env fish

if ! test -e $HOME/.cargo
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -q -y --no-modify-path
end
set -Ua fish_user_paths $HOME/.cargo/bin

if ! test -e ~/.cargo/bin/bat
	cargo install -q bat
end

if ! test -e ~/.cargo/bin/btm
	cargo install -q bottom
end

if ! test -e ~/.cargo/bin/dust
	cargo install -q du-dust
end

if ! test -e ~/.cargo/bin/exa
	cargo install -q exa
end

if ! test -e ~/.cargo/bin/fd
	cargo install -q fd-find
end

if ! test -e ~/.cargo/bin/fzf
	cargo install -q fzf
end

if ! test -e ~/.cargo/bin/git-cliff
	cargo install -q git-cliff
end

if ! test -e ~/.cargo/bin/procs
	cargo install -q procs
end

if ! test -e ~/.cargo/bin/rg
	cargo install -q ripgrep
end

if ! test -e ~/.cargo/bin/sd
	cargo install -q sd
end

if ! test -e ~/.cargo/bin/tldr
	cargo install -q tealdeer
end

if ! test -e ~/.cargo/bin/tokei
	cargo install -q tokei
end

if ! test -e ~/.cargo/bin/z
	cargo install -q zoxide
end
