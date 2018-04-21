function builder {
    flatpak run org.gnome.Builder --user "$@"
}

function flatup {
    if [[ -f /usr/bin/flatpak ]]; then
         /usr/bin/flatpak update --user
    fi
}

function monod {
    flatpak run com.xamarin.MonoDevelop --user "$@"
}
