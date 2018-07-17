function atomup {
    cdfo app-editors/atom-bin
    pkgbver=$(curl -sL https://github.com/atom/atom/releases | grep amd64.tar.gz | grep "beta" | head -n 1 | cut -d '/' -f 6 | sed 's/v//g')
    pkgsver=$(curl -sL https://github.com/atom/atom/releases | grep amd64.tar.gz | grep -v "beta" | head -n 2 | tail -n 1 | cut -d '/' -f 6 | sed 's/v//g')
    pkgpbver=$(ls | cut -d ' ' -f 1 | head -n 2 | tail -n 1 | cut -d '-' -f 3 | sed 's/.ebuild//g' | sed 's/_/-/g')
    pkgpsver=$(ls | cut -d ' ' -f 1 | head -n 1 | cut -d '-' -f 3 | sed 's/.ebuild//g')
    if ! [[ $pkgpbver == $pkgbver ]]; then
         mv atom-bin-${pkgpbver/-/_}.ebuild atom-bin-${pkgbver/-/_}.ebuild
         sudo ebuild atom-bin-${pkgbver}.ebuild manifest
         PKGC="1"
    fi
    if ! [[ $pkgpsver == $pkgsver ]]; then
         mv atom-bin-${pkgpsver}.ebuild atom-bin-${pkgsver}.ebuild
         sudo ebuild atom-bin-${pkgsver}.ebuild manifest
         PKGC="1"
    fi
    if [[ $PKGC == 1 ]]; then
         push "[app-editors/atom-bin] :up: $pkgbver, $pkgsver"
    fi
}
