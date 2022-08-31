#!/usr/bin/sh

sudo pacman -S stow meld starship
git clone https://github.com/emnoor/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow --target=$HOME */
