function cdb {
    cd /boot
}

function cdm {
    cd /etc/portage/package.mask
}

function cdp {
    cd /etc/portage
}

function cdpt {
    cd /usr/portage
}

function cds {
    cd /usr/src/"$1"
}

function cdsh {
    cd $HOME/Shell
}

function cdsl {
    if [[ -n $1 ]]; then
         cds "linux-$1"
    else
         cds "linux"
    fi
}

function cdu {
    cd /etc/portage/package.use
}

function cdvl {
    cd /var/lib/layman
}
