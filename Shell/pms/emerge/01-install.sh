function emaw {
    sudo emerge --autounmask-write "$@"
}

function emin {
    sudo emerge -av "$@"
}

alias emi=emin

function eminna {
    sudo emerge "$@"
}

function empr {
    sudo emerge @preserved-rebuild
}
