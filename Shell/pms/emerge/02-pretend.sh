function empcv {
    sudo emerge -pcv "$@"
}

function empqv {
    sudo emerge -pqv "$@"
}

function empv {
    sudo emerge -pv "$@"
}

function emupv {
     sudo emerge --verbose-conflicts -pvuDU --with-bdeps=y @world
}
