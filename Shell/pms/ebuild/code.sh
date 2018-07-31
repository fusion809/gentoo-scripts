function codeup {
    cdfo app-editors/visual-studio-code
    URL="https://packages.microsoft.com/repos/vscode/pool/main/c/code"
    if `which curl > /dev/null 2>&1`; then
         ver=$(curl -sL $URL | grep "$revn" | cut -d '-' -f 1 | cut -d '_' -f 2)
    fi

    mv visual-studio-code-*.ebuild visual-studio-code-$ver.ebuild
    sudo ebuild visual-studio-code-$ver.ebuild manifest
    push "[app-editors/visual-studio-code] Bumping to $ver"
}

alias vscodeup=codeup
