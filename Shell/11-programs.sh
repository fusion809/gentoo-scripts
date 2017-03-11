if ! [[ -f /usr/bin/pastebinit ]]; then
	emin pastebinit
fi

function pit {
	pastebinit -i "$@" -b http://paste2.org
}
