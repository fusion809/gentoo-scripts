function gvsh {
	pushd $HOME/Shell
	gvim
	popd
}

function vbash {
	vim $HOME/.bashrc
}

function vmc {
	vim /etc/portage/make.conf
}

function vpm {
	vim /etc/portage/package.mask
}

function vpu {
	vim /etc/portage/package.use
}

function vsh {
	pushd $HOME/Shell
	vim
	popd
}

function vvim {
	vim $HOME/.vimrc
}

function vzsh {
	vim $HOME/.zshrc
}
