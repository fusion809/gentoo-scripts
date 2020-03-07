function vim_update_quiet {
	cd /home/fusion809/OBS/home:fusion809/vim
	pkgver=$(wget -q https://github.com/vim/vim/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 5 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
	baseversion=$(echo $pkgver | sed 's/\.[0-9]*$//g')
	patchversion=$(echo $pkgver | sed "s/$baseversion//g" | sed 's/\.//g')
	vim_baseversion=$(cat vim.spec | grep "%define.*baseversion" | sed 's/%define.*baseversion\s*//g' | head -n 1)
	vim_patchversion=$(cat vim.spec | grep "%define.*patchlevel" | sed 's/%define.*patchlevel\s*//g' | head -n 1)

	if ! [[ $pkgver == ${vim_baseversion}.${vim_patchversion} ]]; then
		vimup -y
	fi
}

alias vimupq=vim_update_quiet

function vim_update_quiet_loop {
	while :
    do
           printf "%s\n" "Running vim_update_quiet at $(date +"%r %A, %d %B %Y")"
           vim_update_quiet
           if [[ -n "$@" ]]; then
              sleep "$@"
           else
              sleep 4m
           fi
    done
}

alias vimupql=vim_update_quiet_loop
