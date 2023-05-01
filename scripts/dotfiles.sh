#!/bin/bash

rm -rf  ~/.zshrc
ln ~/.dotfiles/src/zshrc.zsh ~/.zshrc

rm -rf  ~/.config/alacritty.yml
ln ~/.dotfiles/src/alacritty.yml ~/.config/alacritty.yml

rm -rf  ~/.gitconfig
ln ~/.dotfiles/src/gitconfig.ini ~/.gitconfig

rm -rf  ~/.config/helix/{config,languages}.toml
ln ~/.dotfiles/src/helix.toml ~/.config/helix/config.toml
ln ~/.dotfiles/src/helix-languages.toml ~/.config/helix/languages.toml

rm -rf  ~/.config/zellij/config.kdl
mkdir -p ~/.config/zellij
ln ~/.dotfiles/src/zellij.kdl ~/.config/zellij/config.kdl

rm -rf ~/.config/gtk-3.0/gtk.css
ln ~/.dotfiles/src/gtk.css ~/.config/gtk-3.0/gtk.css

rm -rf ~/.config/pier/config.toml
ln ~/.dotfiles/src/pier.toml ~/.config/pier/config.toml
