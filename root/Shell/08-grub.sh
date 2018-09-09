function update-grub {
    grub-mkconfig -o /boot/grub/grub.cfgi
    sed -i -e 's|UUID=ad4103fa-d940-47ca-8506-301d8071d467|/dev/sda3|g' /boot/grub/grub.cfg
}
