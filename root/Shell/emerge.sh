function syncup {
	emerge --sync && emerge -uDU --with-bdeps=y @world
}

function emup {
	emerge -uDU --with-bdeps=y @world
}

function emin {
	emerge -av $@
}

function emrm {
	emerge -Cav $@
}

function ems {
	emerge --sync
}

function emaw {
	emerge --autounmask-write "$@"
}
