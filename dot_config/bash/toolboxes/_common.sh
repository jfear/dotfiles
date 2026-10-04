# _common.sh — shared toolbox helpers

# install_dependencies <pkgs...> — install once per container lifetime.
# The marker lives INSIDE the container (/.first_run), so it vanishes
# when the toolbox is deleted and recreated → auto-reinstalls.
install_dependencies() {
    [ -f /.first_run ] || sudo dnf -y install "$@"
}

# expose <cmd> — make a host command (e.g. flatpak) callable from inside
# this toolbox via flatpak-spawn. [from the article]
expose() {
    [ -f "$1" ] || printf '#!/bin/sh\nexec /usr/bin/flatpak-spawn --host %s "$@"\n' "$(basename "$1")" \
        | sudo tee "$1" >/dev/null && sudo chmod +x "$1"
}

