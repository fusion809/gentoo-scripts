function cdg {
    cd "$GHUB/$1"
}

function cdgo {
    cdg "others/$1"
}

function cdgm {
    cd "$GHUBM/$1"
}

function cdc {
    cdgm "config/$1"
}

function cdgc {
    cdc "gentoo-config/$1"
}

function cded {
    cdgm "editors/$1"
}

function cdvm {
    cded "vim/$1"
}

alias cdvim=cdvm

function cdpk {
    cd "$GHUBM/packaging/$1"
}

function cdfo {
    cd "$HOME/fusion809-overlay/$1"
}

function cdst {
    cdpk "sabayon-tools/$1"
}

function cdsc {
    cdgm "scripts/$1"
}

function cdgn {
    cdgm "GNU_Octave/$1"
}

function cdgs {
    cdsc "gentoo-scripts/$1"
}

function cdweb {
    cd $WEB/$1
}

function cdfgi {
    cdweb "fusion809.github.io/$1"
}
