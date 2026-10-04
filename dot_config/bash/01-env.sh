# Environment Variables

# --- PATH setup --------------------------------
# Local bins — the two standard XDG-ish locations. 
prepend_path "$HOME/.local/bin"
prepend_path "$HOME/bin"
prepend_path "$HOME/.pixi/bin"
prepend_path "$HOME/.cargo/bin"

# --- Environment setup -------------------------

# Proton Pass SSH Agent
export_sock SSH_AUTH_SOCK "$HOME/.ssh/proton-pass-agent.sock"

# QEMU
export LIBVIRT_DEFAULT_URI=qemu:///system
