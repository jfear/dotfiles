#!/usr/bin/env fish

if test -d $HOME/miniconda3/bin/conda
    eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end