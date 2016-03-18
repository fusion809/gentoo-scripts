# Create GitHub directory
mkdir ~/GitHub

# Clone sabayon-scripts repo
git clone https://github.com/fusion809/gentoo-scripts ~/GitHub/sabayon-scripts


# Install Zsh
sudo emerge zsh

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Copy across
cp -a ~/GitHub/gentoo-scripts/{Shell,.bashrc,.zshrc} ~/
sudo cp -a ~/GitHub/gentoo-scripts/root/{Shell,.bashrc,.zshrc} /root/

# Get my self-made zsh-themes
git clone https://github.com/fusion809/zsh-theme ~/GitHub/zsh-theme
cp -a ~/GitHub/zsh-theme/*.zsh-theme ~/.oh-my-zsh/themes/

# Get zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# Change default login shell to Zsh
chsh -s /bin/zsh
sudo chsh -s /bin/zsh
/bin/zsh
