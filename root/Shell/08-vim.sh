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

alias vpmc=vmc

function vpm {
	vim /etc/portage/package.mask
}

function vpk {
    vim /etc/portage/package.keywords
}

function vpu {
	vim /etc/portage/package.use
}

function vsd {
	vim /etc/sddm.conf
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
