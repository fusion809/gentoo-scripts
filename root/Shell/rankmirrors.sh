function rankm {
	cp /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist.backup
	sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
	rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
}
