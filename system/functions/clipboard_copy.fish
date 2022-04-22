#!/usr/bin/env fish

function clipboad_copy -d "Copy /dev/stdin to clipboard"
    set -el fun_input
    if isatty stdin
        set fun_input $argv
    else
        while read -l line
            set --append fun_input "$line"
        end
    end

    if type -q pbcopy
        printf '%s' $fun_input | pbcopy
    else if set -q WAYLAND_DISPLAY; and type -q wl-copy
        printf '%s' $fun_input | wl-copy
    else if set -q DISPLAY; and type -q xsel
        printf '%s' $fun_input | xsel --clipboard
    else if set -q DISPLAY; and type -q xclip
        printf '%s' $fun_input | xclip -selection clipboard
    else if type -q clip.exe
        printf '%s' $fun_input | clip.exe
    end
end