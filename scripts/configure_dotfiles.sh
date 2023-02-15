#!/bin/bash

ln ~/.files/.alacritty.yml ~/.alacritty.yml

ln ~/.files/.gitconfig ~/.gitconfig

rm -rf ~/.zshrc
ln ~/.files/.zshrc ~/.zsh

ln ~/.files/.p10k.zsh ~/.p10k.zsh

rm -rf ~/.config/lvim/config.lua
ln ~/.files/config.lua ~/.config/lvim/config.lua
