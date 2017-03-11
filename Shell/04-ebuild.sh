function manif {
	ebuild *.ebuild manifest
}

function vimup {
	pkgver=$(wget -q https://github.com/vim/vim/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 5 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
	pushd $GHUBM/packaging/vim-overlay/app-editors/vim
	lver_vim=$(ls | grep ebuild | sort -u | tail -n 2 | head -n 1 | cut -d '-' -f 2 | sed 's/\.ebuild//g')
	mv vim-$lver_vim.ebuild vim-$pkgver.ebuild
	sudo ebuild vim-$pkgver.ebuild manifest
	popd
	pushd $GHUBM/packaging/vim-overlay/app-editors/vim-core
	lver_vimc=$(ls | grep ebuild | sort -u | tail -n 2 | head -n 1 | cut -d '-' -f 2 | sed 's/\.ebuild//g')
	mv vim-core-$lver_vimc.ebuild vim-core-$pkgver.ebuild
	sudo ebuild vim-core-$pkgver.ebuild manifest
	popd
	pushd $GHUBM/packaging/vim-overlay/app-editors/gvim
	lver_gvim=$(ls | grep ebuild | sort -u | tail -n 2 | head -n 1 | cut -d '-' -f 2 | sed 's/\.ebuild//g')
	mv gvim-$lver_gvim.ebuild gvim-$pkgver.ebuild
	sudo ebuild gvim-$pkgver.ebuild manifest
	popd
