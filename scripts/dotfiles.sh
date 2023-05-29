#!/bin/bash

rm -rf ~/.zshrc
ln -sf ~/.dotfiles/src/zsh/zshrc.zsh ~/.zshrc

rm -rf ~/.gitconfig
ln -sf ~/.dotfiles/src/git/gitconfig.ini ~/.gitconfig

mkdir -p ~/.config/gh
rm -rf ~/.config/gh/config.yml
ln -sf ~/.dotfiles/src/git/gh.yml ~/.config/gh/config.yml

rm -rf ~/.config/alacritty.yml
ln -sf ~/.dotfiles/src/alacritty/alacritty.yml ~/.config/alacritty.yml

rm -rf ~/.config/tmux/tmux.conf
ln -sf ~/.dotfiles/src/tmux/tmux.conf ~/.config/tmux/tmux.conf

rm -rf ~/.config/helix
ln -sf ~/.dotfiles/src/helix ~/.config/helix

rm -rf ~/.config/lvim
ln -sf ~/.dotfiles/src/lvim ~/.config/lvim

rm -rf ~/.config/pier
ln -sf ~/.dotfiles/src/pier ~/.config/pier
