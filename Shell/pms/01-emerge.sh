function empr {
	sudo emerge @preserved-rebuild
}

function emrm {
	sudo emerge -cav $@
}

function ems {
	emerge -s "$@"
}

for i in $HOME/Shell/pms/emerge/*.sh
do
  . "$i"
done
