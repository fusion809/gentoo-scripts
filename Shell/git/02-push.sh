# Push changes
function push {

    if `printf "$PWD" | grep 'AUR' > /dev/null 2>&1`; then
         mksrcinfo
    elif `printf "$PWD" | grep 'fusion809-overlay' > /dev/null 2>&1`; then
         pushd $PKG/fusion809-overlay && sudo repoman manifest -q && popd
    fi

    git add --all                                        # Add all files to git
    git commit -m "$1"                                   # Commit with message = argument 1
    git push origin $(git-branch)                        # Push to the current branch

    if `echo $PWD | grep "$HOME/Shell" &> /dev/null`; then
         szsh
    elif `echo $PWD | grep "$SCR/gentoo-scripts" &> /dev/null`; then
         szsh
    fi
}

function pusha {

    git add --all
    git commit -m "$1"
    git push origin $(git-branch)

}
