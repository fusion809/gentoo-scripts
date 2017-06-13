function manhtml {
    if ! [[ -n $3 ]]; then
         bzcat /usr/share/man/man$2/$1.$2.bz2 | man2html >> $WEB/man/$1.$2.html
    else
         bzcat /usr/share/man/man$2/$1.$2.bz2 | man2html | tee $WEB/man/$1.$2.html
    fi
}

function manhtmlp {
    L=$(equery files "$1" | grep /usr/share/man/man | grep "bz2")
    for i in $L
    do
        # echo "$i\n"
         NAME=$(echo $i | cut -d '/' -f 2 | sed 's/\.[0-9]\.bz2//g')
         NO=$(echo $i | sed 's/[a-z]//g' | cut -d '/' -f 1)
         manhtml $NAME $NO
    done
}
