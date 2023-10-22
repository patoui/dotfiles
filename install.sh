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

info "Installing dotfiles..."

info "Symlinking zshrc..."

if [ ! -f $HOME/.zshrc ]; then
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
	info "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
	success "Successfully installed Homebrew"
else
	success "Homebrew already installed"
fi

if ! command -v php &> /dev/null; then
	info "Installing PHP..."
	brew install php
	success "Successfully installed PHP"
else
	success "PHP already installed"
fi

if [ ! -f $HOME/.nvm/nvm.sh ]; then
	info "Installing nvm..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
	success "Successfully installed nvm"
else
	success "nvm already installed"
fi

if ! command -v node &> /dev/null; then
	info "Installing Node..."
	. $HOME/.nvm/nvm.sh
	nvm install --lts
	nvm alias default node
	success "Successfully installed Node"
else
	success "Node already installed"
fi

if ! command -v python3 &> /dev/null; then
	info "Installing python..."
	brew install python
	success "Successfully installed python"
else
	success "Python already installed"
fi

if ! command -v go &> /dev/null; then
	info "Installing go..."
	brew install go
	success "Successfully installed go"
else
	success "Go already installed"
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

success "Completed dotfiles installation"
