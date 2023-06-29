#!/bin/sh

echo "Clonning"

git clone https://github.com/kozusznik/dotfiles $HOME/.dotfiles
$HOME/.dotfiles/fresh.sh
. $HOME/.zshrc
