#!/bin/bash

rm -rf  ~/.zshrc
ln ~/.files/src/zshrc.zsh ~/.zshrc

rm -rf  ~/.config/alacritty.yml
ln ~/.files/src/alacritty.yml ~/.config/alacritty.yml

rm -rf  ~/.gitconfig
ln ~/.files/src/gitconfig.ini ~/.gitconfig

rm -rf  ~/.config/helix/{config,languages}.toml
ln ~/.files/src/helix.toml ~/.config/helix/config.toml
ln ~/.files/src/helix-languages.toml ~/.config/helix/languages.toml

rm -rf  ~/.config/zellij/config.kdl
mkdir -p ~/.config/zellij
ln ~/.files/src/zellij.kdl ~/.config/zellij/config.kdl

rm -rf ~/.config/nushell/{env,config}.nu
ln nushell-env.nu ~/.config/nushell/env.nu                                                            03/12/2023 04:10:20 PM
ln nushell.nu ~/.config/nushell/config.nu
  