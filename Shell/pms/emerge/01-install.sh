function emaw {
    sudo emerge --autounmask-write "$@"
}

# Reinstall all packages
function emeav {
    sudo emerge -eav "$@"
}

alias emra=emeav

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

function emmr {
    sudo emerge --keep-going @module-rebuild
}

function empr {
    sudo emerge --keep-going @preserved-rebuild
}
