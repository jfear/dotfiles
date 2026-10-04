# Inside a toolbox: auto-launch nushell for interactive shells, once.

[ -f /run/.toolboxenv ] || return 0

# Only interactive shells, no re-entry, no explicit opt-out
case $- in *i*) ;; *) return 0 ;; esac
[ -n "$_TB_NU_LAUNCHED" ] && return 0
[ -n "$TB_NO_NU" ] && return 0

command -v nu >/dev/null || return 0

_TB_NU_LAUNCHED=1
export _TB_NU_LAUNCHED

exec nu "$@"

