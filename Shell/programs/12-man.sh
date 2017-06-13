function manhtml {
    bzcat /usr/share/man/man${2//[a-z]}/$1.$2.bz2 | man2html >> $WEB/man/$1.$2.html
    sudo chmod 777 $WEB/man/$1.$2.html
}

function manhtmlg {
    bzcat /usr/share/gcc-data/x86_64-pc-linux-gnu/6.3.0/man/man${2}/$1.$2.bz2 | man2html >> $WEB/man/$1.$2.html
    sudo chmod 777 $WEB/man/$1.$2.html
}
function manhtmlp {
    L=$(equery files "$1" | grep /usr/share/man/man | grep "bz2")
    for i in $L
    do
         dNO=$(grep -o "\." <<< "$i" | wc -l)
         NAME=$(echo $i | cut -d '/' -f 6 | sed 's/\.[0-9][a-z]*\.bz2//g')
         NO=$(echo $i | sed 's/\.bz2//g' | cut -d '/' -f 6 | cut -d '.' -f ${dNO})
         manhtml $NAME $NO
    done
}
