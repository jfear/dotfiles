# Tooling Setup

if has gh; then
    eval "$(gh completion -s bash)"
fi

if has starship; then
    eval "$(starship init bash)"
fi
