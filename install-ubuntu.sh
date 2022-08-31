#!/usr/bin/sh

sudo apt-get install stow meld
curl -sS https://starship.rs/install.sh | sh
git clone https://github.com/emnoor/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow --target=$HOME */
