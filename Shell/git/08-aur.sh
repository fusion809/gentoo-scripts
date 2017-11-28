if ! [[ -f $HOME/.ssh/aur.pub ]]; then
    ssh-keygen -f $HOME/.ssh/aur
fi

function gitaur {
     git clone ssh://aur@aur.archlinux.org/$1.git
}

eval `keychain -q --eval aur`
