for i in $HOME/Shell/pms/emerge/*.sh
do
  . "$i"
done

function emupr {
    emup && emrm
}

function emupnm {
    sudo emerge --autounmask-keep-masks --verbose-conflicts --keep-going -uDU --with-bdeps=y @world
}

function syncupnm {
    sync && emupnm
}
