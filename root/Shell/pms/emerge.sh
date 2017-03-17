function ems {
	emerge --sync
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

function emin {
	emerge -av $@
}

function emrm {
	emerge -cav $@
}

function emaw {
	emerge --autounmask-write "$@"
}

function empr {
	emerge @preserved-rebuild
}
