function emaw {
    sudo emerge --autounmask-write "$@"
}

function eminn {
    sudo emerge -av --noreplace "$@"
}

function emin {
    sudo emerge -av "$@"
}

alias emi=emin

function eminna {
    sudo emerge "$@"
}

function eminnna {
    sudo emerge --noreplace "$@"
}

function empr {
    sudo emerge @preserved-rebuild
}
