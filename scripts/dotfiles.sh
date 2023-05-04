#!/bin/bash

rm -rf  ~/.zshrc
ln ~/.dotfiles/src/zsh/zshrc.zsh ~/.zshrc

rm -rf  ~/.config/alacritty.yml
ln ~/.dotfiles/src/alacritty/alacritty.yml ~/.config/alacritty.yml

rm -rf  ~/.gitconfig
ln ~/.dotfiles/src/git/gitconfig.ini ~/.gitconfig

rm -rf ~/.config/tmux/tmux.conf
ln ~/.dotfiles/src/tmux/tmux.conf ~/.config/tmux/tmux.conf

rm -rf  ~/.config/helix/{config,languages}.toml
ln ~/.dotfiles/src/helix/config.toml ~/.config/helix/config.toml
ln ~/.dotfiles/src/helix/languages.toml ~/.config/helix/languages.toml

rm -rf ~/.config/gtk-3.0/gtk.css
ln ~/.dotfiles/src/gtk/gtk.css ~/.config/gtk-3.0/gtk.css

rm -rf ~/.config/pier/config.toml
ln ~/.dotfiles/src/pier/config.toml ~/.config/pier/config.toml
