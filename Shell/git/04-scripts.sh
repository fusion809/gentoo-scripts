## Update local gentoo-scripts repo
function cps {
  sudo chmod +x -R {$HOME,/root}/Shell/
  rm -rf $GS/Shell && mkdir $GS/Shell
  sudo rm -rf $GS/root/Shell
  cp -a $HOME/Shell/* $GS/Shell
  cp -a $HOME/{.bashrc,.zshrc} $GS/
  sudo cp -a /root/{Shell,.bashrc,.zshrc} $GS/root/
  if ! [[ -d $GS/etc/portage ]]; then
	mkdir -p $GS/etc/portage
  fi
  sudo cp -a /etc/portage/* $GS/etc/portage
  if ! [[ -d $GS/etc/kernels ]]; then
  	mkdir -p $GS/etc/kernels
  fi
  sudo cp -a /etc/kernels/* $GS/etc/kernels
}

function cdgs {
  cd $GS
}

## Update gentoo-scripts GitHub repo
function shup {
  cps && cdgs && push "$1" && cd - && szsh
}
