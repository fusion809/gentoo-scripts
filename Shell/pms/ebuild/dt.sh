function dtup {
    pkglver=$(curl -sL https://github.com/linuxdeepin/deepin-terminal/releases | grep "\.tar\.gz" | head -n 1 | cut -d '/' -f 5 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
    pkgpver=$(cat /data/OBS/home:fusion809/deepin-terminal/deepin-terminal.spec | grep "Version:"  | sed 's/Version:\s*//g')

    if ! [[ $pkglver == $pkgpver ]]; then
         cdobsh deepin-terminal
         sed -i -e "s|$pkgpver|$pkglver|g" deepin-terminal.spec
         osc ci -m "Bumping to $pkglver"
    fi
}
