#!/usr/bin/env fish

if ! test -d $HOME/miniconda3
    read -l -P "Install miniconda? [Y/n] " confirm
    switch $confirm
        case '' Y y
            bash -c "curl -SsLo mini.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
                and bash mini.sh -b
                and rm ./mini.sh
                and eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
                and conda install -c conda-forge mamba condax -y
    end
end