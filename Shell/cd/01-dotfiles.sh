function cdat {
    cd "$HOME/.atom/$1"
}

function cdls {
    cd "$HOME/.local/share/$1"
}

function cdap {
    cdls "applications/$1"
}

function cdi {
    cdls "icons/$1"
}

function cddd {
    cdls "desktop-directories/$1"
}
