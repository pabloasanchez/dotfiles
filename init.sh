#!/bin/bash

# TODO other distros

### Debian based

echo update
sudo apt update

# echo upgrade
# sudo apt upgrade

echo ranger
sudo apt install ranger

echo fish
sudo apt install fish

echo fisher - fish plugin manager
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher add sei40kr/fish-ranger-cd

echo fishmarks
curl -L https://github.com/techwizrd/fishmarks/raw/master/install.fish | fish

echo apps
sudo apt install ranger qutebrowser sox calcurse tty-clock ncdu duf fzf newsboat tuir castero surfraw ytfzf

echo common aliases
wget --output-document ~/aliases "https://raw.githubusercontent.com/pabloasanchez/dotfiles/master/aliases.sh"
sudo chmod +x ~/aliases

# Always load aliases in fish
echo "source ~/aliases" >> ~/.config/fish/config.fish

# In fish `ranger .` doesn't work so we use ranger-cd
alias fm=ranger-cd

# TODO neovim

# TODO Scripts

# Other apps
# arigram
# castero
# yt-dlp


# TODO
# node and npm
# node apps
# npm -g i coinmon



# For new installs w/ only root
# useradd -m username
# adduser username sudo
# passwd username
# usermod -aG sudo username
# groups username
# su - username
