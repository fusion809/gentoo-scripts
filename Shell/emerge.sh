function syncup {
	sudo emerge --sync && emup
}

function emup {
	sudo emerge -uDU --with-bdeps=y @world
}

function emin {
	sudo emerge -av $@
}

function emrm {
	sudo emerge -Cav $@
}
