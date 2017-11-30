function pacdesc {
    ver=$(equery m bzip2 | grep "Keywords" | sed 's/Keywords:\s*//g' | cut -d ':' -f 1)
    loc=$(equery m bzip2 | grep "Location" | sed 's/Location:\s*//g')
    simat=$(echo $loc | cut -d '/' -f 5)

    atom="${loc}"/${simat}-$ver.ebuild
    cat $atom | grep "DESCRIPTION" | cut -d '"' -f 2
}

alias pkgdesc=pacdesc

function pactl {
    equery l "*" | cut -d ' ' -f 6 > $HOME/Documents/"Text files"/gentoo-package-list.txt
}

alias pactexlist=pactl
alias paclt=pactl
alias write_package_list_to_file=pactl
