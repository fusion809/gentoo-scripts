function cdp {
	cd "$HOME/Programs/$1"
}

function cdpa {
	cd "$HOME/Programs/AppImages"
}

function cdsh {
	cd "$HOME/Shell/$1"
}

function cddo {
	cd "$HOME/Downloads/$1"
}

function cddc {
	cd "$HOME/Documents/$1"
}

function cdcfe {
	cddc "CodeLite/CPP-Math-Projects/$1"
}

function cdle {
	cdcfe "Lorenz-equations-mysolver/$1"
}

function cdsp {
	cdcfe "Simple-Pendulum/$1"
}
