#!/usr/bin/env fish

function  cpwd -d "copy the current working directory to the clipboad."
    pwd -P | clipboard_copy
end