# Only inside toolbox containers
[ -f /run/.toolboxenv ] || return 0

# Read the container name from podman's metadata file
TOOLBOX_NAME=$(sed -n 's/^name="\(.*\)"$/\1/p' /run/.containerenv)
export TOOLBOX_NAME

for _tbdir in "$HOME/.config/bash/toolboxes" "$HOME/.bashrc.d/toolboxes"; do
    [ -f "$_tbdir/_common.sh" ]        && . "$_tbdir/_common.sh"
    [ -f "$_tbdir/$TOOLBOX_NAME.sh" ]  && . "$_tbdir/$TOOLBOX_NAME.sh"
done
unset _tbdir

