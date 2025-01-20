#!/usr/bin/env bash

set -e

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

info "Configuring environment..."

if [ ! -f $HOME/.zshrc ]; then
	info "Symlinking zshrc..."
	ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
	success "Successfully symlinked zshrc"
else
	success "zshrc already symlinked"
fi

if [[ $ZSH != *oh-my-zsh* ]]; then
	info "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	success "Successfully install oh-my-zsh"
else
	success "oh-my-zsh already installed"
fi

if ! command -v brew &> /dev/null; then
	info "Installing homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
	success "Successfully installed Homebrew"
else
	success "homebrew already installed"
fi

if ! command -v php &> /dev/null; then
	info "Installing php..."
	brew install php
	success "Successfully installed php"
else
	success "php already installed"
fi

if ! command -v composer &> /dev/null; then
	info "Installing composer..."
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"
	sudo mv composer.phar /usr/local/bin/composer
	success "Successfully installed composer"
else
	success "composer already installed"
fi

if ! command -v pkg-config &> /dev/null; then
	info "Installing pkg-config..."
	brew install pkg-config
	success "Successfully installed pkg-config"
else
	success "pkg-config already installed"
fi

if php -r 'exit((int) extension_loaded("redis"));'; then
	info "Installing php-redis..."
	pecl install redis
	success "Successfully installed php-redis"
else
	success "php-redis already installed"
fi

if ! command -v convert &> /dev/null; then
	info "Installing imagemagick..."
	brew install imagemagick
	success "Successfully installed imagemagick"
else
	success "imagemagick already installed"
fi

if php -r 'exit((int) extension_loaded("imagick"));'; then
	info "Installing php-imagick..."
	pecl install imagick
	success "Successfully installed php-imagick"
else
	success "php-imagick already installed"
fi

if [ ! -f $HOME/.nvm/nvm.sh ]; then
	info "Installing nvm..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
	success "Successfully installed nvm"
else
	success "nvm already installed"
fi

if ! command -v node &> /dev/null; then
	info "Installing node..."
	. $HOME/.nvm/nvm.sh
	nvm install --lts
	nvm alias default node
	success "Successfully installed node"
else
	success "node already installed"
fi

if ! command -v python3 &> /dev/null; then
	info "Installing python..."
	brew install python
	success "Successfully installed python"
else
	success "python already installed"
fi

if ! command -v go &> /dev/null; then
	info "Installing go..."
	brew install go
	success "Successfully installed go"
else
	success "go already installed"
fi

# Neovim dependencies
if ! command -v rg &> /dev/null; then
	info "Installing ripgrep..."
	brew install ripgrep
	success "Successfully install ripgrep"
else
	success "ripgrep already installed"
fi

# Install Neovim
if ! command -v nvim &> /dev/null; then
	info "Installing neovim..."
	brew install neovim
	success "Successfully install neovim"
else
	success "neovim already installed"
fi

# Symlink Neovim configs
if [ ! -d $HOME/.config/nvim ]; then
	ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim
	success "Successfully symlinked nvim"
else
	success "nvim alread symlinked"
fi

if ! command -v watchman &> /dev/null; then
	info "Installing watchman..."
	brew install watchman
	success "Successfully install watchman"
else
	success "watchman already installed"
fi

if ! command -v jq &> /dev/null; then
	info "Installing jq..."
	brew install jq
	success "Successfully install jq"
else
	success "jq already installed"
fi

if ! command -v ngrok &> /dev/null; then
	info "Installing ngrok..."
	brew install ngrok
	success "Successfully install ngrok"
else
	success "ngrok already installed"
fi

if ! command -v wget &> /dev/null; then
	info "Installing wget..."
	brew install wget
	success "Successfully install wget"
else
	success "wget already installed"
fi

if ! command -v lua &> /dev/null; then
	info "Installing lua..."
	brew install lua
	success "Successfully install lua"
else
	success "lua already installed"
fi

if ! command -v java &> /dev/null; then
	info "Installing java..."
	brew install java
	success "Successfully install java"
else
	success "java already installed"
fi

if ! command -v ffmpeg &> /dev/null; then
	info "Installing ffmpeg..."
	brew install ffmpeg
	success "Successfully install ffmpeg"
else
	success "ffmpeg already installed"
fi

if ! command -v sysbench &> /dev/null; then
	info "Installing sysbench..."
	brew install sysbench
	success "Successfully install sysbench"
else
	success "sysbench already installed"
fi

if ! command -v psql &> /dev/null; then
	info "Installing postgres..."
	brew install postgresql@16
	success "Successfully install postgres"
else
	success "postgres already installed"
fi

if ! command -v pt-mysql-summary &> /dev/null; then
	info "Installing percona toolkit..."
	brew install percona-toolkit
	success "Successfully install percona toolkit"
else
	success "percona toolkit already installed"
fi

if ! command -v http &> /dev/null; then
	info "Installing httpie..."
	brew install httpie
	success "Successfully install httpie"
else
	success "httpie already installed"
fi

if ! command -v bat &> /dev/null; then
	info "Installing bat..."
	brew install bat
	success "Successfully install bat"
else
	success "bat already installed"
fi

if ! command -v fzf &> /dev/null; then
	info "Installing fzf..."
	brew install fzf
	success "Successfully install fzf"
else
	success "fzf already installed"
fi

if ! command -v tldr &> /dev/null; then
	info "Installing tldr..."
	brew install tldr
	success "Successfully install tldr"
else
	success "tldr already installed"
fi

success "Finished configuring environment"
