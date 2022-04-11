#!/usr/bin/env fish

if ! command -q starship
    curl --proto '=https' --tlsv1.2 -sSL https://starship.rs/install.sh | sh -s -- -y -b $HOME/.local/bin
end

set -Ux STARSHIP_CONFIG $DOTFILES_ROOT/starship/config.toml
