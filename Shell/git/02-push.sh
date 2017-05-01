# Push changes
function push {

    if `printf "$PWD" | grep 'AUR' > /dev/null 2>&1`; then
         mksrcinfo
    elif `printf "$PWD" | grep 'fusion809-overlay' > /dev/null 2>&1`; then
         repoman manifest -q
    fi

    git add --all                                        # Add all files to git
    git commit -m "$1"                                   # Commit with message = argument 1
    git push origin $(git-branch)                        # Push to the current branch

}

function pusha {

    git add --all
    git commit
    git push origin $(git-branch)

}
