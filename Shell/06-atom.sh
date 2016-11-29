if ! `which atom >/dev/null 2>&1`; then
	alias atom="$HOME/Programs/AppImages/Atom*AppImage"
fi

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
	if ! [[ -d $HOME/GitHub/mine/packaging/sabayon-tools ]]; then
		git clone https://github.com/fusion809/sabayon-tools $HOME/GitHub/mine/packaging/sabayon-tools
	fi
	atom $HOME/GitHub/mine/packaging/sabayon-tools
}
