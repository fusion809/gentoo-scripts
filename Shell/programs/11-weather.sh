function weathv {
    curl -sL wttr.in/townsville
}

alias weather=weathv

function weathd {
    weathv | head -n "$1" | tail -n 1 | sed 's/[-\.\ \:\_\;]//g'
}

alias weatherd=weathd

function temp {
    weathd 3
}

alias temperature=temp

function cond {
    weathd 4
}

alias conditions=cond
