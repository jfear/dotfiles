#!/usr/bin/env fish

if test ! -d ~/.fonts
    mkdir -p ~/.fonts
end

curl -o FiraCode.zip -sL https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip
    and unzip -d ~/.fonts/FiraCode -oq FiraCode.zip
    and rm FiraCode.zip

curl -o Inconsolata.zip -sL https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Inconsolata.zip
    and unzip -d ~/.fonts/Inconsolata -oq Inconsolata.zip
    and rm Inconsolata.zip

curl -o Hack.zip -sL https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip
    and unzip -d ~/.fonts/Hack -oq Hack.zip
    and rm Hack.zip

fc-cache
