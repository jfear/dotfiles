#!/usr/bin/env fish

alias less="less -S"
alias l="clear"

function s -d "move up one or <cnt> directories"
    # Shortcut to cd. If a count is given then cd up that many levels.
    if test (count $argv) -eq 0
        cd ../
    else
        for i in (seq $argv)
            cd ../
        end
    end
end