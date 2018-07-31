function codeliteup {
    pkgpver=$(cat /data/OBS/home:fusion809/codelite/PKGBUILD | grep "pkgver=" | cut -d '=' -f 2)
    pkglver=$(curl -sL https://github.com/eranif/codelite/releases | grep "app\.tar\.gz" | head -n 1 | cut -d '/' -f 6)
    if ! [[ $pkgpver == $pkglver ]]; then
         cdobsh codelite
         sed -i -e "s|pkgver=$pkgpver|pkgver=$pkglver|g" PKGBUILD
         sed -i -e "s|$pkgpver|$pkglver|g" codelite.spec
         osc ci -m "Bumping to $pkglver"
         cdfo dev-util/codelite
         mv codelite-$pkgpver.ebuild codelite-$pkglver.ebuild
         sudo ebuild codelite-$pkglver.ebuild manifest
         push "[dev-util/codelite] Bumping to $pkglver"
    fi
}

alias clup=codeliteup
