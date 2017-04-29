function octcli {
    octave --no-gui
}

function octe {
    octave --eval "$@"
}

function ctof {
    octe "$1*1.8+32"
}
