#!/bin/bash

# TODO other distros

### Alpine
# doas apk update
# doas apk upgrade -v

### Debian based

echo update
sudo apt update

# For new installs w/ only root
read -p "Add a new user now? (y/n) " ANSWER
if [[ $ANSWER == 'y' ]]
then
  read -p "User name: " USERNAME
  useradd -m $USERNAME

  read -p "Add to sudo group? (y/n) " ANSWER
  if [[ $ANSWER == 'y' ]]
  then
    adduser $USERNAME sudo
    usermod -aG sudo $USERNAME
    groups $USERNAME
  fi

  passwd $USERNAME
  su - $USERNAME
fi

read -p "Upgrade apt now? (y/n) " ANSWER
if [[ $ANSWER == 'y' ]]
then
  sudo apt upgrade
fi

echo fish
sudo apt install fish

echo fisher - fish plugin manager
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fish -c 'fisher install sei40kr/fish-ranger-cd'

echo fishmarks
curl -L https://github.com/techwizrd/fishmarks/raw/master/install.fish | fish

echo fish - remember last dir user function
curl -s "https://raw.githubusercontent.com/pabloasanchez/dotfiles/2022/fish/functions/user-defined.fish" >> $HOME/.config/fish/functions/user-defined.fish
echo "source $HOME/.config/fish/functions/user-defined.fish" >> $HOME/.config/fish/config.fish

echo installing common dependencies
sudo apt install git cmake curl wget

echo installing apps
sudo apt install ranger sox calcurse tty-clock ncdu duf fzf newsboat surfraw ytfzf chafa w3m

echo x programs
sudo apt install qutebrowser feh sxiv

echo common aliases
wget --output-document $HOME/aliases "https://raw.githubusercontent.com/pabloasanchez/dotfiles/master/aliases.sh"
sudo chmod +x $HOME/aliases

# Always load aliases in fish
echo "source $HOME/aliases" >> $HOME/.config/fish/config.fish

echo kb us intl
setxkbmap -layout us -variant intl
echo "setxkbmap -layout us -variant intl" >> $HOME/.config/fish/config.fish

# default browsers
echo browsers
export TUIR_BROWSER=w3m
export BROWSER=qutebrowser
echo "set TUIR_BROWSER w3m" >> $HOME/.config/fish/config.fish
echo "set BROWSER qutebrowser" >> $HOME/.config/fish/config.fish

# TODO copy w3m config
mkdir -p $HOME/.w3m
curl -s "https://gist.github.com/Grimorian/2dc57e185eaca40c3a269d821651f04d" > $HOME/.w3m/keymap

# TODO copy qutebrowser config

# In fish `ranger .` doesn't work so we use ranger-cd
alias fm=ranger-cd

# neovim
# TODO ARM
echo neovim
cd $HOME
mkdir -p Downloads && cd Downloads
mkdir nvim && cd nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar -xvzf nvim-linux64.tar.gz

mkdir -p $HOME/Apps
mv nvim-linux64 $HOME/Apps/
sudo ln $HOME/Apps/nvim-linux64/bin/nvim /usr/local/bin/nvim
cd $HOME
git clone https://github.com/pabloasanchez/vim-customized
mv vim-customized/ .vim
cd .vim
make link
echo vim-plug
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Don't forget to :PlugInstall upon first Neovim run."
echo "set EDITOR nvim" >> $HOME/.config/fish/config.fish

# from git
mkdir -p $HOME/Apps
cd $HOME/Apps
git clone https://github.com/AngelJumbo/lavat
cd lavat
sudo make install

# TODO Scripts

echo ".deb downloads"
cd $HOME
mkdir -p Downloads
cd Downloads
wget https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb
sudo apt install ./duf_0.8.1_linux_amd64.deb

# Other apps
# arigram
# castero
# yt-dlp
cd $HOME/Downloads
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp  # Make executable

echo python
sudo apt install python3-pip

# python apps
pip install tuir
pip install castero

echo go
cd $HOME/Downloads
wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
# bash
EXPORT_GO_BASH="export PATH=$PATH:/usr/local/go/bin"
echo "$EXPORT_GO_BASH" >> $HOME/.profile
eval "$EXPORT_GO_BASH"
# fish
EXPORT_GO_FISH="set -x PATH $PATH:/usr/local/go/bin"
echo $EXPORT_GO_FISH  >> $HOME/.config/fish/config.fish
eval "$EXPORT_GO_FISH"

# go apps
cd $HOME/Downloads
go install github.com/jesseduffield/lazygit@latest
go install github.com/mathaou/termdbms@latest

echo node and npm
## From binaries
# VERSION=v18.12.1
# DISTRO=linux-x64
# PKGNAME=node-$VERSION-$DISTRO.tar.xz
# NODEJS_DIR=/usr/local/lib/nodejs
# wget https://nodejs.org/dist/$VERSION/$PKGNAME
# # ARM https://nodejs.org/dist/v18.12.1/node-v18.12.1-linux-armv7l.tar.xz
# # Other options https://nodejs.org/en/download/
# sudo mkdir -p /usr/local/lib/nodejs
# sudo tar -xJvf $PKGNAME -C /usr/local/lib/nodejs

## or using a Node Version Manager
# Fish: 
fish <<'END_FISH'
  fisher install jorgebucaran/nvm.fish
  nvm install latest
END_FISH

# bash:   
# wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# node apps
npm -g i coinmon

# SSH
echo ssh
WHOAMI=$(whoami)
cd $HOME
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
chown -R $WHOAMI:$WHOAMI .ssh

read -p "Add ssh access now? (y/n) " ANSWER
if [[ $ANSWER == 'y' ]]
then
  read -p "Input a public key to add to authorized_keys: " $PUBKEY
  echo $PUBKEY >> $HOME/.ssh/authorized_keys
  cat $HOME/.ssh/authorized_keys
fi

echo Remember to update sshd_config

# TODO Docker, add to docker group
# TODO librex

