## Update local funtoo-scripts and funtoo-config repos
function cps {
    # scripts
    sudo chmod +x -R {$HOME,/root}/Shell/
    sudo rm -rf $GS/Shell && mkdir $GS/Shell
    sudo rm -rf $GS/root/Shell
    cp -a $HOME/Shell/* $GS/Shell
    cp -a $HOME/{.bashrc,.zshrc} $GS/
    sudo mkdir -p $GS/root
    sudo cp -a /root/{Shell,.bashrc,.zshrc} $GS/root
}

function cpc {
    # config
    if ! [[ -d $GC/etc/portage ]]; then
        mkdir -p $GC/etc/portage
    fi
    sudo cp -a /etc/portage/* $GC/etc/portage
    if ! [[ -d $GC/etc/kernels ]]; then
        mkdir -p $GC/etc/kernels
    fi
    sudo cp -a /etc/kernels/* $GC/etc/kernels
}

function cdgc {
    cd $GC
}

function cdgs {
    cd $GS
}

## Update gentoo-scripts GitHub repo
function shup {
    cps && cdgs && push "$1" && cd - && szsh
}

function cup {
    cpc && cdgc && push "$1" && cd -
}
