function ems {
        emerge -s "$@"
}

function sync {
        emerge --sync && layman -S
}

function syncup {
        sync && emerge -uDU --with-bdeps=y @world
}

function emup {
        emerge -uDU --with-bdeps=y @world
}

