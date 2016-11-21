function syncup {
	sudo emerge --sync && emup
}

alias ems=syncup

function emup {
	sudo emerge --verbose-conflicts -uDU --with-bdeps=y @world
}

function emcup {
	sudo emerge -uDU --with-bdeps=y --binpkg-changed-deps=n @world
}

function emin {
	sudo emerge -av $@
}

function emrm {
	sudo emerge -Cav $@
}

function emaw {
	sudo emerge --autounmask-write $@
}

function etup {
	sudo etc-update --automode -5
}

function empr {
	sudo emerge @preserved-rebuild
}
