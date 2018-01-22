function ems {
    emerge -s "$@"
}

function sync {
    emerge --sync

    if [[ -f /usr/bin/layman ]]; then
         layman -S
    fi
}

function emup {
    emerge -uDU --with-bdeps=y --keep-going --backtrack=100 @world
}

function syncup {
    sync && emup
}

function emuppv {
    emerge -uDUpv --with-bdeps=y --backtrack=100 @world
}

function emaup {
    emerge -uDU --with-bdeps=y --backtrack=100 --autounmask-write @world
}

function update {
    syncup && emrm
}
