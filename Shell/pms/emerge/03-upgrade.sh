function emcup {
    sudo emerge -uDU --with-bdeps=y --binpkg-changed-deps=n @world
}

function emup {
    sudo emerge --exclude=games-rpg/runescape-launcher-2.2.4-r2 --autounmask-write --verbose-conflicts --keep-going -uDU --with-bdeps=y @world
}

function emaup {
    sudo emerge --verbose-conflicts -auvDU --with-bdeps=y @world
}

function empvup {
    sudo emerge --verbose-conflicts -pv -uDU --with-bdeps=y @world
}

alias emuppv=empvup

function sync {
    sudo emerge --sync

    if [[ -L /usr/bin/layman ]]; then
         sudo layman -S
    fi
}

function laysyn {
    sudo layman -S
}

function laysynup {
    laysyn && emup && empr
}

function syncup {
    sync && emup && empr
}
