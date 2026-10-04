# Only inside toolbox containers
[ -f /run/.toolboxenv ] || return 0

# Read the container name from podman's metadata file
TOOLBOX_NAME=$(sed -n 's/^name="\(.*\)"$/\1/p' /run/.containerenv)
export TOOLBOX_NAME

_tb_configured=0
for _tbdir in "$HOME/.config/bash/toolboxes" "$HOME/.bashrc.d/toolboxes"; do
    [ -f "$_tbdir/_common.sh" ] && . "$_tbdir/_common.sh"
    if [ -f "$_tbdir/$TOOLBOX_NAME.sh" ]; then
        . "$_tbdir/$TOOLBOX_NAME.sh"
        _tb_configured=1
    fi
done
unset _tbdir

# First-run bootstrap, only for toolboxes we have config for
if [ "$_tb_configured" -eq 1 ] && ! [ -f /.first_run ]; then
    [[ $(type -t setup) == function ]] && setup
    # /.first_run lives INSIDE the container: survives restarts, but is wiped
    # when the toolbox is deleted/recreated → re-bootstraps automatically.
    sudo touch /.first_run
fi
unset _tb_configured

