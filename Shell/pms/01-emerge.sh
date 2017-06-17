for i in $HOME/Shell/pms/emerge/*.sh
do
  . "$i"
done

function emupr {
    emup && emrm
}
