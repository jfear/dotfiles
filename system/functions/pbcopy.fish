#!/usr/bin/env fish

if command -q pbcopy
    continue
else if command -q wl-copy
    alias pbcopy="wl-copy"
else if command -q xclip
    alias pbcopy="xclip -selection clipboard"
end
