#!/bin/sh

echo "Clonning"

git clone https://github.com/kozusznik/dotfiles $HOME/.dotfiles
git -C $HOME/.dotfiles/ submodule init
git -C $HOME/.dotfiles/ submodule update
$HOME/.dotfiles/fresh.sh
