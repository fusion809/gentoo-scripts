function ems {
    emerge -s "$@"
}

function emsc {
    emerge -s "%@^$@"
}

for i in $HOME/Shell/pms/emerge/*.sh
do
  . "$i"
done
