#!/usr/bin/env bash

sudo nixos-rebuild switch -I nixos-config=$HOME/.dotfiles/config/configuration.nix

sudo cp $HOME/.dotfiles/config/* /etc/nixos -r
