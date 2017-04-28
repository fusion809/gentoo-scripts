function emaw {
    emerge --autounmask-write "$@"
}

function emin {
    emerge -av $@
}

function emmr {
    emerge @module-rebuild
}

function emmrav {
    emerge -av @module-rebuild
}

function empr {
    emerge -av @preserved-rebuild
}
