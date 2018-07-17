# Update Brave web browser in fusion809-overlay to latest version
function bravup {
    cdfo www-client/brave-bin
    PBRAVE_VER=$(ls | grep ebuild | cut -d '-' -f 3 | sed 's/\.ebuild//g')
    CBRAVE_VER=$(wget -q https://github.com/brave/browser-laptop/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 5 | cut -d '"' -f 1 | sed 's/[a-z]//g' | sed 's/\.*$//g' | sed 's/\.tar\.gz//g')
    BRAVE_TAR=$(wget -q https://github.com/brave/browser-laptop/releases -O - | grep "$CBRAVE_VER" | grep "Brave.tar.bz2")

    if ! [[ $PBRAVE_VER == $CBRAVE_VER ]] && `echo $BRAVE_TAR > /dev/null 2>&1`; then
         mv brave-bin-${PBRAVE_VER}.ebuild brave-bin-${CBRAVE_VER}.ebuild
         sudo rm -rf Manifest
         sudo ebuild brave-bin-${CBRAVE_VER}.ebuild manifest merge
         push "[www-client/brave-bin] Bumping to ${CBRAVE_VER}"
    else
         printf "Either the latest version hasn't had Brave.tar.bz2 tagged to it or the latest version is already in the $FO repo.\n"
    fi
}
