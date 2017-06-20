function jekex {
    if ! [[ -d .bundle ]] || ! [[ -f Gemfile ]]; then
        cdfgi
    fi
    bundle exec jekyll serve -I -D --future
}
