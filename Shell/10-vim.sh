function gvd {
	pushd "$1"
	gvim
	popd
}

function vd {
	pushd "$1"
	vim
	popd
}

function gvfgi {
	gvd $FGI
}

function gvsh {
	gvd $HOME/Shell
}

function ved {
	vim *.ebuild
}

function vrc {
	vim $HOME/.zshrc
}

function vsh {
	vd $HOME/Shell
}
