function cdpk {
    cdgm "packaging/$1"
}

function cdaim {
    cdpk "AppImages/$1"
}

function cdgam {
    cdpk "GVim.AppImage/$1"
}

function cdst {
    cdpk "sabayon-tools/$1"
}

function cdfo {
    cdpk "fusion809-overlay/$1"
}
