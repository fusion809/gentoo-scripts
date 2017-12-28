function space {
    FS=$(mount | grep " / " | sed 's|.*\/ type ||g' | cut -d ' ' -f 1)
    if [[ $FS == "btrfs" ]]; then
         sudo btrfs fi show | head -n 3 | grep "devid" | cut -d ' ' -f 9
    else
         df -h /
    fi
}
