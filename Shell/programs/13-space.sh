function space {]
    FS=$(mount | grep " / " | sed 's|.*\/ type ||g' | cut -d ' ' -f 1)
    if [[ $FS == "btrfs" ]]; then
         btrfs fi df /
    else
         df -h /
    fi
}
