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
	success "zshrc alread symlinked"
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
	success "PHP alread installed"
fi

success "Completed dotfiles installation"
