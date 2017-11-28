if ! [[ -f ~/.ssh/aur.pub ]]; then
    ssh-keygen -f ~/.ssh/aur
    printf "Host aur.archlinux.org\n   IdentityFile ~/.ssh/aur\n   User aur" >> ~/.ssh/config
fi

function gitaur {
     git clone ssh://aur@aur.archlinux.org/$1.git
}

eval `keychain -q --eval aur`
