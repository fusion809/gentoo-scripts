function cpc {
    # config
    if ! [[ -d $GC/etc/portage ]]; then
         sudo mkdir -p $GC/etc/portage
    fi

    sudo cp -a /etc/portage/* $GC/etc/portage
    if ! [[ -d $GC/etc/kernels ]]; then
         sudo mkdir -p $GC/etc/kernels
    fi

    sudo cp -a /etc/kernels/* $GC/etc/kernels
    if ! [[ -d $GC/etc/env.d ]]; then
         sudo mkdir -p $GC/etc/env.d
    fi

    sudo cp /etc/env.d/99editor $GC/etc/env.d

    if ! [[ -d $GC/etc/default ]]; then
         sudo mkdir -p $GC/etc/default
    fi

    if ! [[ -d $GC/var/lib/portage ]]; then
         sudo mkdir -p $GC/var/lib/portage
    fi

    sudo cp /etc/default/grub $GC/etc/default

    sudo cp /etc/fstab $GC/etc
    sudo cp /etc/group $GC/etc
    sudo cp /etc/hostname $GC/etc
    sudo cp /etc/locale.conf $GC/etc
    sudo cp /etc/locale.gen $GC/etc
    sudo cp /etc/profile $GC/etc
    sudo cp /etc/sddm.conf $GC/etc
    sudo cp /etc/sudoers $GC/etc

    sudo cp /var/lib/portage/world $GC/var/lib/portage
}

function cdgc {
    cd $GC
}

function cup {
    cpc && cdgc && push "$1" && cd -
}

