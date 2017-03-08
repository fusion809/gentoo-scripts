function cdat {
	cd $HOME/.atom/$1
}

function cdg {
	cd $GHUB/$1
}

function cdgm {
	cd $GHUBM/$1
}

function cded {
	cdgm "editors/$1"
}

function cdvm {
	cded "vim/$1"
}

function cdsc {
	cdgm "scripts/$1"
}

function cdgs {
	cdsc "gentoo-scripts/$1"
}

function cdp {
	cd $HOME/Programs/$1
}

function cdpa {
	cd $HOME/Programs/AppImages
}

function cdsh {
	cd $HOME/Shell/$1
}

function cdst {
	cd $GHUBM/packaging/sabayon-tools/$1
}

function cddo {
	cd $HOME/Downloads/$1
}

function cddc {
	cd $HOME/Documents/$1
}

function cdap {
	cd $HOME/.local/share/applications/
}

function cdi {
	cd $HOME/.local/share/icons/
}

function cddd {
	cd $HOME/.local/share/desktop-directories/
}
