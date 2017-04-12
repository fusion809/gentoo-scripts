function gvd {
    pushd "$1"
    gvim
    popd
}

function sgvd {
    pushd "$1"
    sudo gvim
    popd
}

function vd {
    pushd "$1"
    vim
    popd
}

function svd {
    pushd "$1"
    sudo vim
    popd
}
