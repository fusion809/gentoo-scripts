function vd {
    if ! [[ $PWD == "$1" ]]; then
         pushd "$1"
         vim
         popd
    else
         vim
    fi
}

function svd {
    pushd "$1"
    sudo vim
    popd
}
