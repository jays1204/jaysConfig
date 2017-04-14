#!/usr/bin/env bash

cp .bashrc ~/.bashrc
cp .gitconfig ~/.gitconfig
cp .vimrc ~/.vimrc
cp .git-completion.sh ~/.git-completion.sh
cp .git-flow-completion.sh ~/.git-flow-completion.sh
cp .git-flow-completion.zsh ~/.git-flow-completion.zsh
cp .zshrc ~/.zshrc

# key repeat 
defaults write NSGlobalDomain KeyRepeat -float 1.8
defaults write NSGlobalDomain InitialKeyRepeat -int 13

source ~/.bashrc
