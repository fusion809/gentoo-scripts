function cda {
    cd "$HOME/AUR/$1"
}

function cddo {
    cd "$HOME/Downloads/$1"
}

function cdlog {
    cd "$HOME/log/$1"
}

function cdm {
    cd "$HOME/Music/$1"
}

function cdpi {
    cd "$HOME/Pictures/$1"
}

function cdps {
    cdpi "Screenshots/$1"
}

function cdsh {
    cd "$HOME/Shell/$1"
}

function cdt {
    cd "$HOME/Textbooks/$1"
}

function cdv {
    cd "$HOME/Videos/$1"
}

function cdvs {
    cdv "SO/$1"
}

function cdvy {
    cdv "YouTube/$1"
}

# VirtualBox VMs
function cdvt {
    cd "$HOME/VirtualBox VMs/$1"
}

function cdvi {
    cdvt "ISOs/$1"
}

function cdvil {
    cdvi "Linux/$1"
}
