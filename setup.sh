#!/usr/bin/env bash

sudo nix-channel --add "https://github.com/nix-community/home-manager/archive/release-$(cat ./nixos-version).tar.gz" home-manager
sudo nix-channel --add "https://nixos.org/channels/nixpkgs-unstable" nixpkgs-unstable
sudo nix-channel --add "https://nixos.org/channels/nixos-$(cat ./nixos-version)" nixos
sudo nix-channel --update
