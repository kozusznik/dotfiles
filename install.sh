#!/bin/sh

echo "Clonning"

git clone https://github.com/kozusznik/dotfiles $HOME/.dotfiles
git submodule update
$HOME/.dotfiles/fresh.sh
. $HOME/.zshrc
