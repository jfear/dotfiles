#!/usr/bin/env fish

if ! test -e $HOME/.cargo
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -q -y --no-modify-path

end
set -ga fish_user_paths $HOME/.cargo/bin
