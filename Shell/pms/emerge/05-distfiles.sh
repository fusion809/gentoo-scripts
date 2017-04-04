function diss {
    du -sh /usr/portage/distfiles
}

function ldis {
    ls /usr/portage/distfiles
}

function repc {
    ldis | sed 's/[-,][0-9].*//g'
}

function rmd {
    for i in "$@"
    do
         sudo rm /usr/portage/distfiles/"$i"
    done
}

