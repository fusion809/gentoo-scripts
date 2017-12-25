function btrsi {
    btrfs filesystem df /
}

#USED=$(sudo btrfs filesystem show /dev/sda2 | grep "[a-z]" | cut -d ' ' -f 9 | tail -n 1)
#TOTAL=$(sudo btrfs filesystem show /dev/sda2 | grep "[a-z]" | cut -d ' ' -f 7 | tail -n 1)

#function size {
#    printf "$USED/$TOTAL\n"
#}
