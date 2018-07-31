function atomup {
    cdfo app-editors/atom-bin
    pkgbver=$(curl -sL https://github.com/atom/atom/releases | grep amd64.tar.gz | grep "beta" | head -n 1 | cut -d '/' -f 6 | sed 's/v//g')
    pkgsver=$(curl -sL https://github.com/atom/atom/releases | grep amd64.tar.gz | grep -v "beta" | head -n 2 | tail -n 1 | cut -d '/' -f 6 | sed 's/v//g')
    pkgbbver=${pkgbver/-*/}
    pkgbrel=${pkgbver/*-beta/}
    pkgpbver=$(ls | cut -d ' ' -f 1 | head -n 2 | tail -n 1 | cut -d '-' -f 3 | sed 's/.ebuild//g' | sed 's/_/-/g')
    pkgpbbver=${pkgpbver/-*/}
    pkgpbrel=${pkgpbver/*-beta}
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

    if ! [[ $pkgpbver == $pkgbver ]]; then
         sed -i -e "s|_pkgver=${pkgpbbver}|_pkgver=${pkgbbver}|g" PKGBUILD
         sed -i -e "s|_pkgrel=${pkgpbrel}|_pkgrel=${pkgbrel}|g" PKGBUILD
         updpkgsums
         push "Bumping to $pkgbver"
    fi
}
