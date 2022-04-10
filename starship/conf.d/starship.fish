#!/usr/bin/env fish
if command -q starship and status is-interactive
    starship init fish | source
end
