function aroot {
    sudo arch-chroot /mnt/arch /usr/local/bin/su-fusion809
}

function groot {
    if ! [[ -f /gentoo-runit/proc/config.gz ]]; then
        sudo mount -t proc /proc /gentoo-runit/proc
        sudo mount --rbind /dev /gentoo-runit/dev
        sudo mount --make-rslave /gentoo-runit/dev
        sudo mount --rbind /sys /gentoo-runit/sys
        sudo mount --make-rslave /gentoo-runit/sys
        sudo rm /gentoo-runit/etc/resolv.conf
        sudo cp /etc/resolv.conf /gentoo-runit/etc
        sudo chroot /gentoo-runit /usr/local/bin/md
    fi

    sudo chroot /gentoo-runit /usr/local/bin/su-fusion809
}
