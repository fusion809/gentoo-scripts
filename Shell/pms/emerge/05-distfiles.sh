function diss {
    du -sh /usr/portage/distfiles
}

function ldis {
    ls /usr/portage/distfiles
}

function rmd {
    sudo rm /usr/portage/distfiles/"$1"
}

