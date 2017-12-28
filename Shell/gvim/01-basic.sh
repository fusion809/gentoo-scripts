function gvd {
    if ! [[ $PWD == "$1" ]]; then
         pushd "$1"
         gvim
         popd
    else
         gvim
    fi
}

function sgvd {
    pushd "$1"
    sudo gvim
    popd
}
