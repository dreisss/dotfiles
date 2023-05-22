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

mkdir -p ~/.config/tmux
rm -rf ~/.config/tmux/tmux.conf
ln -sf ~/.dotfiles/src/tmux/tmux.conf ~/.config/tmux/tmux.conf

mkdir -p ~/.config/helix
rm -rf  ~/.config/helix/{config,languages}.toml
ln -sf ~/.dotfiles/src/helix/config.toml ~/.config/helix/config.toml
ln -sf ~/.dotfiles/src/helix/languages.toml ~/.config/helix/languages.toml

mkdir -p ~/.config/pier
rm -rf ~/.config/pier/config.toml
ln -sf ~/.dotfiles/src/pier/config.toml ~/.config/pier/config.toml

