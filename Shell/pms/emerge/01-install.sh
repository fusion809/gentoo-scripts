function emaw {
    sudo emerge --autounmask-write "$@"
}

function emin {
    sudo emerge -av --noreplace "$@"
}

alias emi=emin

function eminna {
    sudo emerge --noreplace "$@"
}

function empr {
    sudo emerge @preserved-rebuild
}
