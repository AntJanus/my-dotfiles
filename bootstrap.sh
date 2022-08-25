#!/usr/bin/env bash

sudo apt update
sudo apt install fd-find

cp -r .* ~/

echo "Installing helpful packages from Apt"
sudo apt install -y direnv
echo "Done"

echo "Install ZSH"
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.scripts
echo "ZSH installed"

echo "Installing Neovim..."
sudo apt install -y neovim
echo "Neovim installed. Installing plug..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Neovim plug installed"

echo "Installing FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "FZF installed"

echo "Installing NodeJS"
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "Nodejs installed"

echo "Installing NPM packages"
sudo npm install -g \
	commitizen \
	cz-conventional-changelog \
	prettier \
	npm-check-updates \
	neovim \
	yarn
echo "NPM packages installed"
