function emaw {
    emerge --autounmask-write "$@"
}

function emin {
    emerge -av $@
}

function emmr {
    emerge --keep-going @module-rebuild
}

function emmrav {
    emerge -av --keep-going @module-rebuild
}

function empr {
    emerge -av @preserved-rebuild
}
