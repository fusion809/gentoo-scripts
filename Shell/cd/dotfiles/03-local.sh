function cdls {
    cd "$HOME/.local/share/$1"
}

function cdap {
    cdls "applications/$1"
}

function cdi {
    cdls "icons/$1"
}

alias cdli=cdi

function cddd {
    cdls "desktop-directories/$1"
}
function cdat {
    cd "$HOME/.atom/$1"
}

function cdlt {
    cdls "themes/$1"
}

