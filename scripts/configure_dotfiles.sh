#!/bin/bash

ln ~/.files/.alacritty.yml ~/.alacritty.yml

ln ~/.files/.gitconfig ~/.gitconfig

rm -rf ~/.zshrc
ln ~/.files/.zshrc ~/.zshrc

ln ~/.files/.p10k.zsh ~/.p10k.zsh

rm -rf ~/.config/helix/config.toml
ln ~/.files/config.toml ~/.config/helix/config.toml
