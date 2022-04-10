#!/usr/bin/env fish

function __copy_command_to_clipboard -d "copy the current command line to the clipboard."
    set -l cursor_position (commandline -C)
    set -l cmd (commandline -b)

    commandline -r "pbcopy '$cmd'"
    commandline -C $cursor_position
    commandline -f execute
end