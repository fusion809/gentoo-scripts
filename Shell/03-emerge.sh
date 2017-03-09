function emaw {
	sudo emerge --autounmask-write $@
}

function emcup {
	sudo emerge -uDU --with-bdeps=y --binpkg-changed-deps=n @world
}

function emin {
	sudo emerge -av $@
}

function empr {
	sudo emerge @preserved-rebuild
}

function emrm {
	sudo emerge -Cav $@
}

function ems {
	emerge -s "$@"
}

function emup {
	sudo emerge --verbose-conflicts -uDU --with-bdeps=y @world
}

function etup {
	sudo etc-update --automode -5
}

function sync {
	sudo emerge --sync
}

function syncup {
	sync && emup
}
