#!/usr/bin/env fish

if command -q nvim
    alias vi="nvim"
    alias vim="nvim"
else if command -q vim
    alias vi="vim"
    alias nvim="vim"
else
    alias vim="vi"
    alias nvim="vi"
end