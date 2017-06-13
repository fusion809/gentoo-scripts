function manhtml {
    bzcat /usr/share/man/man$2/$1.$2.bz2 | man2html | tee $WEB/man/$1.$2.html
}
