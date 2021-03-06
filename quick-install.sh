# Create GitHub/mine/scripts directory
if ! [[ -d $HOME/GitHub/mine/scripts ]]; then
  mkdir $HOME/GitHub/mine/scripts
fi

# Get openssh, if not pre-installed and Zsh
if ! `which ssh >/dev/null 2>&1`; then
  sudo emerge -av openssh
fi

if ! [[ -f /bin/zsh ]]; then
  sudo emerge -av app-shells/zsh
fi

# Clone gentoo-scripts repo
if ! [[ -d $HOME/GitHub/mine/scripts/gentoo-scripts ]]; then
  git clone https://github.com/fusion809/gentoo-scripts $HOME/GitHub/mine/scripts/gentoo-scripts
  # Copy across
  cp -a $HOME/GitHub/mine/scripts/gentoo-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp -a $HOME/GitHub/mine/scripts/gentoo-scripts/root/{Shell,.bashrc,.zshrc} /root/
else
  cd $HOME/GitHub/mine/scripts/gentoo-scripts
  git pull origin master
  cd -
  # Copy across
  cp -a $HOME/GitHub/mine/scripts/gentoo-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp -a $HOME/GitHub/mine/scripts/gentoo-scripts/root/{Shell,.bashrc,.zshrc} /root/
fi

if ! [[ -d $HOME/.oh-my-zsh ]]; then
  # git clone oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
else
  cd $HOME/.oh-my-zsh
  git pull origin master
  cd -
fi

if ! [[ -d $HOME/GitHub/mine/scripts/zsh-theme ]]; then
# Get my self-made zsh-themes
  git clone https://github.com/fusion809/zsh-theme $HOME/GitHub/mine/scripts/zsh-theme
  cp -a $HOME/GitHub/mine/scripts/zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
else
  cd $HOME/GitHub/mine/scripts/zsh-theme
  git pull origin master
  cd -
  cp -a $HOME/GitHub/mine/scripts/zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
fi

if ! [[ -d $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting ]]; then
  # Get zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

if ! [[ -d $HOME/.oh-my-zsh/plugins/zsh-history-substring-search ]]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.oh-my-zsh/plugins/zsh-history-substring-search
fi

if ! [[ -f /usr/bin/keychain ]]; then
    sudo emerge net-misc/keychain
fi

# Change default login shell to Zsh
chsh -s /bin/zsh
sudo chsh -s /bin/zsh
/bin/zsh
