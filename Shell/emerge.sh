function syncup {
	sudo emerge --sync && emup
}

alias ems=syncup

function emup {
	sudo emerge --verbose-conflicts -uDU --with-bdeps=y @world
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
