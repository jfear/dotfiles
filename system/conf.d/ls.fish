#!/usr/bin/env fish

if command -q exa
    alias ls="exa"
    alias la="exa -1 --icons"
    alias ll="exa -lh --time-style long-iso --icons"

    function lt -w exa
        if string match -qar "\d+" $argv[1]
            # First argument is numeric, use as depth limit
            exa -TL $argv
        else
            exa -T $argv
        end
    end
else
    alias ls="command ls --color=auto"
    alias la="ls -1"
    alias ll="ls -lh"

    function lt -w tree
        if type -q tree
            tree $argv
        else
            echo "Please install exa or tree."
        end
    end
end