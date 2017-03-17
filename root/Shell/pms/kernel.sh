function kern-build {
	cd /usr/src/linux
	make -j9
	make modules_install
	make install
	emmr
}
