function ems {
    emerge -s "$@"
}

function emsc {
    emerge -s "%@^$@"
}

alias emc=emsc
