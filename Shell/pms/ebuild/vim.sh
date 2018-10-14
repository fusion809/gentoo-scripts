function ovimup {
	cdobsh $1
	pkgver=$(wget -q https://github.com/vim/vim/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 5 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
	baseversion=$(echo $pkgver | sed 's/\.[0-9]*$//g')
	patchversion=$(echo $pkgver | sed "s/$baseversion//g" | sed 's/\.//g')
	vim_baseversion=$(cat vim.spec | grep "%define.*baseversion" | sed 's/%define.*baseversion\s*//g' | head -n 1)
	vim_patchversion=$(cat vim.spec | grep "%define.*patchlevel" | sed 's/%define.*patchlevel\s*//g' | head -n 1)

	if [[ $baseversion != $vim_baseversion ]]; then

		 sed -i -e "s|baseversion $vim_baseversion|baseversion $baseversion|g" vim.spec
		 sed -i -e "s|$vim_baseversion|$baseversion|g" $HOME/{AUR,OBS/home:fusion809}/gvim-gtk2/PKGBUILD
		 sed -i -e 's|Release:	 [0-9].*|Release:	 1|g' vim.spec

	fi

	if [[ $patchversion != $vim_patchversion ]]; then
		 sed -i -e "s|patchlevel $vim_patchversion|patchlevel $patchversion|g" vim.spec
		 sed -i -e 's|Release:	 [0-9].*|Release:	 1|g' vim.spec

		 if [[ "$1" == "vim" ]]; then
			# Bumping vim-debian* packaging files
			printf '\e[1;34m%-0s\e[m' "sedding the vim-debian* packaging files to update to $pkgver."
			printf "\n"
			sed -i -e "s|$vim_baseversion.$vim_patchversion|$pkgver|g" $HOME/OBS/home:fusion809/vim-debian{,-gtk3}/{debian.dsc,_service}
			time=$(date +"%a, %d %b %Y %H:%M:%S")
			sed -i "1s/^/vim (2:$pkgver-1) trusty; urgency=medium\n\n  * New upstream release\n\n -- Brenton Horne <brentonhorne77@gmail.com>  $time +1000\n\n/" $HOME/OBS/home:fusion809/vim-debian{,-gtk3}/debian.changelog

			# Comitting AUR bump
			sed -i -e "s|$vim_patchversion|$patchversion|g" {$OBSH,$HOME/AUR}/gvim-gtk2/PKGBUILD
			printf '\e[1;32m%-0s\e[m' "Trying to set up AUR key."
			cd $HOME/AUR/gvim-gtk2
			printf '\e[1;34m%-0s\e[m' "Bumping AUR package gvim-gtk2 to $pkgver."
			printf "\n"
			push "Bumping to $pkgver"
			cd -

			# Comitting gvim-gtk2 OBS package bump
			cd $HOME/OBS/home:fusion809/gvim-gtk2
			printf '\e[1;34m%-0s\e[m' "Bumping gvim-gtk2 OBS package to $pkgver."
			printf "\n"
			osc ci -m "Bumping to $pkgver"
			cd -

			# Comitting vim-debian OBS package bump
			cd $HOME/OBS/home:fusion809/vim-debian
			printf '\e[1;34m%-0s\e[m' "Bumping vim-debian to $pkgver."
			printf "\n"
			osc ci -m "Bumping to $pkgver"
			cd -

			# Comitting vim-debian-gtk3 OBS package bump
			cd $HOME/OBS/home:fusion809/vim-debian-gtk3
			printf '\e[1;34m%-0s\e[m' "Bumping vim-debian-gtk3 to $pkgver."
			printf "\n"
			osc ci -m "Bumping to $pkgver"
			cd -
		 fi
	fi

	if [[ $baseversion != $vim_baseversion ]] || [[ $patchversion != $vim_patchversion ]]; then
		 if [[ "$1" == "vim" ]]; then
			printf '\e[1;34m%-0s\e[m' "Bumping vim to $pkgver."
			printf "\n"
		 fi
		 osc ci -m "Bumping version to $pkgver"
	fi
}

function vimupb {
	# Determine latest Vim version by reading Vim releases page on GitHub
	pkgver=$(wget -q https://github.com/vim/vim/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 5 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')

	############################################################
	##################### app-editors/vim ######################
	############################################################

	# Move to app-editors/vim dir
	pushd $PK/fusion809-overlay/app-editors/vim

	# Determine latest ebuild for Vim's pkgver
	lver_vim=$(ls | grep ebuild | sort -u | tail -n 2 | head -n 1 | cut -d '-' -f 2 | sed 's/\.ebuild//g')

	# Check if latest ebuild ver and latest Vim ver match
	if ! [[ $lver_vim == $pkgver ]]; then
		# Bump the ebuild if they do not match
		# Wildcard is required as otherwise -r1, -r2, -r3, etc. will be ignored as suffixes.
		mv vim-$lver_vim*.ebuild vim-$pkgver.ebuild
		# Update manifests and merge package
		sudo ebuild vim-$pkgver.ebuild manifest
	fi

	# Pop out of app-editors/vim dir
	popd

	############################################################
	################### app-editors/vim-core ###################
	############################################################
	# Change into app-editors/vim-core dir
	pushd $PK/fusion809-overlay/app-editors/vim-core

	# Get version of the newest ebuild in app-editors/vim-core
	lver_vimc=$(ls | grep ebuild | sort -u | tail -n 2 | head -n 1 | cut -d '-' -f 3 | sed 's/\.ebuild//g')

	# Check if pkgver and lver_vimc match
	if ! [[ $lver_vimc == $pkgver ]]; then
		# bump the ebuild if it they do not match
		mv vim-core-$lver_vimc*.ebuild vim-core-$pkgver.ebuild
		# Update manifests and merge package
		sudo ebuild vim-core-$pkgver.ebuild manifest
	fi

	# Pop back out
	popd

	############################################################
	##################### app-editors/gvim #####################
	############################################################
	# Change into app-editors/gvim
	pushd $PK/fusion809-overlay/app-editors/gvim

	# Determine version of latest ebuild
	lver_gvim=$(ls | grep ebuild | sort -u | tail -n 2 | head -n 1 | cut -d '-' -f 2 | sed 's/\.ebuild//g')

	# Check if version matches pkgver
	if ! [[ $lver_gvim == $pkgver ]]; then
		# Bump ebuild to pkgver if they do not match
		mv gvim-$lver_gvim*.ebuild gvim-$pkgver.ebuild
		# Update manifests and merge package
		sudo ebuild gvim-$pkgver.ebuild manifest
	fi

	# Commit to repo
	push "Bumping version to $pkgver"

	# Pop out
	popd
}

# Update Vim in OBS, fusion809-overlay and AUR
function vimup {
	cdobsh vim
	pkgver=$(wget -q https://github.com/vim/vim/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 5 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
	baseversion=$(echo $pkgver | sed 's/\.[0-9]*$//g')
	patchversion=$(echo $pkgver | sed "s/$baseversion//g" | sed 's/\.//g')
	vim_baseversion=$(cat vim.spec | grep "%define.*baseversion" | sed 's/%define.*baseversion\s*//g' | head -n 1)
	vim_patchversion=$(cat vim.spec | grep "%define.*patchlevel" | sed 's/%define.*patchlevel\s*//g' | head -n 1)
	pkgpver=${vim_baseversion}.${vim_patchversion}

	if [[ $pkgver == $pkgpver ]]; then
		 printf "Vim is up-to-date!\n"
	else
		 vimupb

		 printf '\e[1;34m%-0s\e[m' "Running ovimup vim."
		 printf "\n"
		 ovimup vim

		 printf '\e[1;34m%-0s\e[m' "Running ovimup vim-suse."
		 printf "\n"
		 ovimup "vim-suse"

		 printf '\e[1;34m%-0s\e[m' "Running ovimup vim-redhat."
		 printf "\n"
		 ovimup "vim-redhat"
	fi
}
