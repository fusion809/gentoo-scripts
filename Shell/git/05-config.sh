function cpc {
    # config
    if ! [[ -d $GC/etc/portage ]]; then
        mkdir -p $GC/etc/portage
    fi

    sudo cp -a /etc/portage/* $GC/etc/portage
    if ! [[ -d $GC/etc/kernels ]]; then
        mkdir -p $GC/etc/kernels
    fi

    sudo cp -a /etc/kernels/* $GC/etc/kernels
    if ! [[ -d $GC/etc/env.d ]]; then
         mkdir -p $GC/etc/env.d
    fi

    sudo cp /etc/env.d/99editor $GC/etc/env.d
}

function cdgc {
    cd $GC
}

function cup {
    cpc && cdgc && push "$1" && cd -
}

