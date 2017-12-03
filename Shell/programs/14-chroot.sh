function aroot {
    if ! [[ -f /arch/proc/consoles ]]; then
         sudo arch-chroot /arch /usr/local/bin/su-fusion809
    else
         sudo chroot /arch /usr/local/bin/su-fusion809
    fi
}

function groot {
    if ! [[ -f /gentoo/proc/consoles ]]; then
        sudo mount -t proc /proc /gentoo/proc
        sudo mount --rbind /dev /gentoo/dev
        sudo mount --make-rslave /gentoo/dev
        sudo mount --rbind /sys /gentoo/sys
        sudo mount --make-rslave /gentoo/sys
        sudo rm /gentoo/etc/resolv.conf
        sudo cp /etc/resolv.conf /gentoo/etc
    fi

    sudo chroot /gentoo /usr/local/bin/su-fusion809
}

function vroot {
    if ! [[ -f /void/proc/consoles ]]; then
         sudo arch-chroot /void /usr/local/bin/su-fusion809
    else
         sudo chroot /void /usr/local/bin/su-fusion809
    fi
}
