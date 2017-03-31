function emaw {
    sudo emerge --autounmask-write "$@"
}

function emin {
    sudo emerge -av "$@"
}

function eminna {
    sudo emerge "$@"
}

function empr {
    sudo emerge @preserved-rebuild
}
