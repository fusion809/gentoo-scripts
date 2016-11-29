set -u

ATOM_VERSION=$(wget -q "https://api.github.com/repos/atom/atom/releases/latest"  -O - | grep -E "https.*atom-amd64.tar.gz" | cut -d'"' -f4 | cut -d '/' -f 8 | sed 's/v//g')

if ! [[ -f $HOME/Programs/AppImages/Atom_${ATOM_VERSION}.glibc2.14-x86_64.AppImage ]]; then
	printf "Atom-${ATOM_VERSION}.glibc2.14-x86_64.AppImage does not exist locally! Downloading...\n"
	wget -c "https://bintray.com/fusion809/AppImages/download_file?file_path=Atom-${ATOM_VERSION}.glibc2.14-x86_64.AppImage" -O Atom-${ATOM_VERSION}.glibc2.14-x86_64.AppImage || printf "Download failed!\n Perhaps I have not triggered the build of the latest Atom version yet?\n"
	printf "Marking Atom-${ATOM_VERSION}.glibc2.14-x86_64.AppImage executable.\n"
	chmod +x Atom-${ATOM_VERSION}.glibc2.14-x86_64.AppImage || printf "Marking Atom-${ATOM_VERSION}.glibc2.14-x86_64.AppImage executable failed!\n"
fi

if ! `which atom >/dev/null 2>&1`; then
	alias atom="$HOME/Programs/AppImages/Atom-${ATOM_VERSION}.glibc2.14-x86_64.AppImage"
fi

function edga {
	atom $GHUB/atom*[0-9]
}

function edsh {
	atom $HOME/Shell
}

function apmi {
	apm install "$@"
}

function apmr {
	apm remove "$@"
}

function apmup {
	apm update --no-confirm
}

function edst {
	if ! [[ -d $HOME/GitHub/mine/packaging/sabayon-tools ]]; then
		git clone https://github.com/fusion809/sabayon-tools $HOME/GitHub/mine/packaging/sabayon-tools
	fi
	atom $HOME/GitHub/mine/packaging/sabayon-tools
}
