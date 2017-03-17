function kern-build {
	cd /usr/src/linux
	make -j9
	make modules_install
	make install
	emmr
	KERN=$(ls -ld /usr/src/linux | cut -d ' ' -f 11 | sed 's/linux\-//g')
	dracut -f --fstab --xz /boot/initramfs-$KERN.img $KERN
	cp /boot/*$KERN* /boot/efi
}
