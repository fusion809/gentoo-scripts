function ems {
    emerge -s "$@"
}

function sync {
    emerge --sync

    if [[ -f /usr/bin/layman ]]; then
         layman -S
    fi
}

function syncup {
    sync && emerge -uDU --with-bdeps=y @world
}

function emup {
    emerge -uDU --with-bdeps=y @world
}

function update {
    syncup && emrm
}
