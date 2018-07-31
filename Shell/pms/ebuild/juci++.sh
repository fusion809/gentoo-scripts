function juci++up {
    cda jucipp
    pkglver=$(curl -sL https://github.com/cppit/jucipp/releases | grep "tar\.gz" | cut -d '/' -f 5 | head -n 1 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
    pkgpver=$(sed -n 's/pkgver=//p' PKGBUILD)

    if ! [[ $pkglver == $pkgpver ]]; then
         sed -i -e "s|pkgver=$pkgpver|pkgver=$pkglver|g" PKGBUILD
         push "Bumping to $pkglver"
         cdfo dev-util/jucipp
         mv jucipp-$pkgpver.ebuild jucipp-$pkglver.ebuild
         push "Bumping to $pkglver"
    fi
}

alias jucippup=juci++up
alias j++up=juci++up
alias jppup=juci++up
alias jupp=juciii+up
