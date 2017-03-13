## Update local gentoo-scripts repo
function cps {
  sudo chmod +x -R {$HOME,/root}/Shell/
  rm -rf $GS/Shell && mkdir $GS/Shell
  sudo rm -rf $GS/root/Shell
  cp -a $HOME/Shell/* $GS/Shell
  cp -a $HOME/{.bashrc,.zshrc} $GS/
  sudo cp -a /root/{Shell,.bashrc,.zshrc} $GS/root/
}

function cdgs {
  cd $GS
}

## Update gentoo-scripts GitHub repo
function shup {
  cps && cdgs && push "$1" && cd - && szsh
}