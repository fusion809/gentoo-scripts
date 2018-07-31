function sublup {
    cdfo app-editors/sublime-text
    pkgverl=$(curl -sL http://www.sublimetext.com/3 | grep "dmg" | sed 's/.*Build //g' | sed 's/.dmg.*//g')
    pkgverp=$(ls -ld * | tail -n 1 | sed 's/[a-zA-Z0-9: .]*sublime-text//g' | cut -d '-' -f 8 | sed 's/.ebuild//g')

    if [[ $pkgverl == $pkgverp ]]; then
         printf "Sublime Text is up-to-date.\n"
    else
         mv sublime-text-$pkgverp.ebuild sublime-text-$pkgverl.ebuild
         sudo ebuild sublime-text-$pkgverl.ebuild manifest
         push "Bumping to $pkgverl"
    fi
}
