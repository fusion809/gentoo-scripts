function space {
    sudo btrfs fi show | head -n 3 | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} "devid" | cut -d ' ' -f 9
}
