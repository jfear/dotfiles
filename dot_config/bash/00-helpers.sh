# Common shell helpers

# --- Path manipulation -----------------------------------------------------

# prepend_path <dir> [<var>] — add dir to front of PATH-like var (default: PATH).
# Skips if dir doesn't exist or is already present.
prepend_path() {
    local dir=${1:?usage: prepend_path <dir> [var]}
    local var=${2:-PATH}
    local current=${!var-}
    case ":$current:" in
        ":$dir:")
            ;;
        *)
            [ -d "$dir" ] && eval "$var=\"$dir\${$var:+:\$$var}\""
            ;;
    esac
}

# append_path <dir> [<var>] — add dir to end of PATH-like var.
append_path() {
    local dir=${1:?usage: append_path <dir> [var]}
    local var=${2:-PATH}
    local current=${!var-}
    case ":$current:" in
        ":$dir:")
            ;;
        *)
            [ -d "$dir" ] && eval "$var=\"\${$var:+\$$var:}$dir\""
            ;;
    esac
}

# remove_path <dir> [<var>] — strip a directory from a PATH-like var.
remove_path() {
    local dir=${1:?usage: remove_path <dir> [var]}
    local var=${2:-PATH}
    local current=${!var-}
    local cleaned=() entry
    IFS=: read -ra cleaned <<< "$current"
    current=""
    for entry in "${cleaned[@]}"; do
        [ "$entry" = "$dir" ] && continue
        current="${current:+$current:}$entry"
    done
    eval "$var=\$current"
}

# --- Conditional exports (only set if the target exists) --------------------
#
# Usage: export_<type> <var> <path>
# Fails silently (no export) if the path is missing or the wrong type.

# Socket (e.g. SSH_AUTH_SOCK)
export_sock() {
    local var=${1:?usage: export_sock <var> <path>}
    local path=${2:?usage: export_sock <var> <path>}
    [ -S "$path" ] && export "$var=$path"
}

# Regular file or symlink to one (resolves symlinks)
export_file() {
    local var=${1:?usage: export_file <var> <path>}
    local path=${2:?usage: export_file <var> <path>}
    [ -f "$path" ] && export "$var=$path"
}

# Symlink itself (exists and *is* a symlink, regardless of target)
export_link() {
    local var=${1:?usage: export_link <var> <path>}
    local path=${2:?usage: export_link <var> <path>}
    [ -L "$path" ] && export "$var=$path"
}

# Directory (e.g. XDG-ish paths, tool homes)
export_dir() {
    local var=${1:?usage: export_dir <var> <path>}
    local path=${2:?usage: export_dir <var> <path>}
    [ -d "$path" ] && export "$var=$path"
}

# --- Utilities --------------------------------------------------------------

# has <cmd> — quietly check for a command (used by later snippets).
has() { command -v "$1" &>/dev/null; }

# addenv <var> <value> — append a value to a var, creating it if unset.
addenv() { eval "${1:?}=\"\${$1:+\$$1:}$2\""; }

# mkcd <dir> — mkdir -p && cd.
mkcd() { mkdir -p -- "$1" && cd -- "$1"; }

# up [n] — go up n directories (default 1).
up() { local n=${1:-1}; cd "$(printf '../%.0s' $(seq 1 "$n"))" || return; }

# extract <archive> — handle most archive formats.
extract() {
    [ -f "$1" ] || { echo "extract: '$1' is not a file" >&2; return 1; }
    case "$1" in
        *.tar.bz2|*.tbz2) tar xjf "$1" ;;
        *.tar.gz|*.tgz)   tar xzf "$1" ;;
        *.tar.xz)         tar xJf "$1" ;;
        *.tar.zst)        tar --zstd -xf "$1" ;;
        *.tar)            tar xf "$1" ;;
        *.bz2)            bunzip2 "$1" ;;
        *.gz)             gunzip "$1" ;;
        *.zip|*.zipx)     unzip "$1" ;;
        *.rar)            unrar x "$1" ;;
        *.7z)             7z x "$1" ;;
        *.Z)              uncompress "$1" ;;
        *) echo "extract: unknown archive type: '$1'" >&2; return 1 ;;
    esac
}

# backup <file> — copy file to file.bak.YYYY-MM-DD.
backup() {
    [ -e "$1" ] || { echo "backup: no such file: '$1'" >&2; return 1; }
    cp -a -- "$1" "$1.bak.$(date +%F)"
}

