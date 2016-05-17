# Create GitHub directory
if ! [[ -d $HOME/GitHub ]]; then
  mkdir ~/GitHub
fi

# Get openssh, if not pre-installed and Zsh
if which openssh >/dev/null 2>&1; then
  sudo emerge openssh
fi

if which zsh >/dev/null 2>&1; then
  sudo emerge app-shells/zsh
fi

# Clone gentoo-scripts repo
if ! [[ -d $HOME/GitHub/gentoo-scripts ]] || ! [[ -d $HOME/GitHub/mine/gentoo-scripts ]]; then
  git clone https://github.com/fusion809/gentoo-scripts ~/GitHub/mine/gentoo-scripts
  # Copy across
  cp -a $HOME/GitHub/mine/gentoo-scripts/{Shell,.bashrc,.zshrc} ~/
  sudo cp -a $HOME/GitHub/mine/gentoo-scripts/root/{Shell,.bashrc,.zshrc} /root/
elif [[ -d $HOME/GitHub/gentoo-scripts ]]; then
  cd $HOME/GitHub/gentoo-scripts
  git pull origin master
  cd -
  # Copy across
  cp -a $HOME/GitHub/gentoo-scripts/{Shell,.bashrc,.zshrc} ~/
  sudo cp -a $HOME/GitHub/gentoo-scripts/root/{Shell,.bashrc,.zshrc} /root/
elif [[ -d $HOME/GitHub/mine/gentoo-scripts ]]; then
  cd $HOME/GitHub/mine/gentoo-scripts
  git pull origin master
  cd -
  # Copy across
  cp -a $HOME/GitHub/mine/gentoo-scripts/{Shell,.bashrc,.zshrc} ~/
  sudo cp -a $HOME/GitHub/mine/gentoo-scripts/root/{Shell,.bashrc,.zshrc} /root/
fi

if ! [[ -d $HOME/.oh-my-zsh ]]; then
  # git clone oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
else
  cd $HOME/.oh-my-zsh
  git pull origin master
  cd -
fi

if ! [[ -d $HOME/GitHub/{,mine/}zsh-theme ]]; then
# Get my self-made zsh-themes
  git clone https://github.com/fusion809/zsh-theme $HOME/GitHub/mine/zsh-theme
  cp -a ~/GitHub/mine/zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
else
  cd $HOME/GitHub/{,mine/}zsh-theme
  git pull origin master
  cd -
  cp -a ~/GitHub/{,mine/}zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
fi

if ! [[ -d $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting ]]; then
  # Get zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

if ! [[ -d $HOME/.oh-my-zsh/plugins/zsh-history-substring-search ]]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/plugins/zsh-history-substring-search
fi

# Change default login shell to Zsh
chsh -s /bin/zsh
sudo chsh -s /bin/zsh
/bin/zsh -c "source ~/.zshrc"
