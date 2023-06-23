#!/usr/bin/env fish

if ! test -d $HOME/mambaforge
    read -l -P "Install mambaforge? [Y/n] " confirm
    switch $confirm
        case '' Y y
            read -l -P "Install location? [~/mambaforge] " prefix
            switch $prefix
                case ''
                    set prefix $HOME/mambaforge
            end


            bash -c "curl -SsLo mini.sh https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"
                and bash mini.sh -b -p $prefix
                and rm ./mini.sh
                and eval $prefix/bin/conda "shell.fish" "hook" $argv | source
                and echo "\
                if test -e $prefix/bin/conda
                    eval $prefix/bin/conda \"shell.fish\" \"hook\" \$argv | source
                end
                " | fish_indent > $HOME/.config/fish/conf.d/mamba.fish
                and mamba update --all -y
                and mamba install -c conda-forge condax invoke black ruff -y
    end
end