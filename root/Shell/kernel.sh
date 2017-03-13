function kern-build {
	cd /usr/src/linux
	make modules_prepare
	make -j9
	make modules_install
	make install
	emerge -av @module-rebuild
}
