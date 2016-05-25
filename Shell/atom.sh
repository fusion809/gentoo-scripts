function edga {
	atom $GHUB/atom*[0-9]
}

function edsh {
	atom $HOME/Shell
}

function apmi {
	apm install "$@"
}

function apmr {
	apm remove "$@"
}

function apmup {
	apm update --no-confirm
}

function edst {
	atom $HOME/GitHub/mine/sabayon-tools
}
