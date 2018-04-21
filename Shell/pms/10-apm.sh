function apmup {
    if `which apm > /dev/null 2>&1`; then
         apm update --no-confirm
    fi
}

alias apmu=apmup
